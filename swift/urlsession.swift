import Foundation

/* MEMO:
　一度出力ストリームに書き込むと、StreamDelegateが新しいhasSpaceAvailableイベントを受信するまで、再び書き込むことはできない。
*/

/* TIP:
  ストリームするデータが非同期プロセスから来るときは、出力ストリームに書き込む前に準備が完了している必要がある。データを受け入れる準備ができるまでデータを保持するために、循環バッファを用いる方法がある。
*/

// アップロードを行うときに、データをやり取りするためのStream境界Pair
struct Streams { 
    let input: InputStream
    let output: OutputStream
}

class UploadManager { 
    lazy var session: URLSession = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
    // UplaodTaskにアプリからストリームを使って、データを渡すために使用
    lazy var boundStream: Streams = {
        var inputOrNil: InputStream? = nil
        var outputOrNil: OutputStream? = nil
        Stream.getBoundStreams(
            withBufferSize: 4096, 
            inputStream: &inputStream,
            outputStream: &outputStream
        )
        guard let input = inputOrNil, let output = outputOrNil else { 
            fatalError("On return of `getBoundStreams`, both `inputStream`")
        }
        // configure and open output Stream
        output.delegate = self
        output.schedule(in: .current, forMode: .default)
        output.open()
        return Streams(input: input, output: output)
    }()
    // OutputStreamへの書き込みが可能か
    private(set) var canWrite = false
    private let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak seflf] timer in 
        guard let self = self else { return }

        if self.canWrite { 
            let message = "*** \(Date())\r\n"
            guard let messageData = message.data(using: .utf8) else { return }
            let messageCount = messageData.count
            let bytesWritten: Int = messageData.withUnsafeBytes() { (buffer: UnsafePointer<UInt8>) in 
                self.canWrite = false
                // 書き込まれると、OuputStreamはInputStreamにバインドされているため、自動的にURL先にアップロードする
                return self.boundStream.output.write(buffer, maxLength: messageCount)
            }
            if bytesWritten < messageCount { 
                // 予期したデータ量よりも大きい場合はハンドリングする
            }
        }
    }

    func createStreamingUploadTask(urlSession: URLSession) -> URLSessionUploadTask { 
        let url = URL("")
        var request: URLRequest = URLRequest(
                url: url, 
                cachePolicy: .reloadIgnoringLocalCacheData, 
                timeoutInterval: 10
            )
        request.httpMethod = "POST"
        let uploadTask = urlSession.uploadTask(withStreamedRequest: request)
        uploadTask.resume()
        return uploadTask
    }
}

extension UploadManager: URLSessionTaskDelegate { 
    // task.resume()を実行したときに、このデリゲートメソッドが呼ばれる
    func urlSession(_ session: URLSession, task: URLSessionTask, needNewBodyStream completionHandler: @escaping (InputStream?) -> Void) {
        // UploadTaskにストリームを提供 
        completionHandler(boundStream.input)
    }
}

extension UploadManager: StreamDelegate { 
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        guard aStraem == boundStream.output else { return }
        // eventCodeが.hasSpaceAvailableを含むとき、ストリームの準備ができた
        // ストリームが準備が完了していないと、出力ストリームにデータを書き込むとはできない
        if eventCode.contains(.hasSpaceAvailable) { canWrite = true }
        if eventCode.contains(.errorOccurred) {
            // ストリームを閉じて、アップロードが失敗したことをユーザにアラート
        }
    }
}


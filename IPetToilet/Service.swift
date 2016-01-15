import Foundation

/*
Verbinding met REST api
*/
class Service
{
    private let baseUrl = NSURL(string: "http://datatank.stad.gent/4/Infrastructuur/")
    private let session: NSURLSession
    
    init() {
        session = NSURLSession(configuration: NSURLSessionConfiguration.ephemeralSessionConfiguration())
    }
    
    func createFetchTask(onCompletion onCompletion: [Hondenvoorziening] -> Void) -> NSURLSessionTask {
        let request = NSMutableURLRequest(URL: (baseUrl?.URLByAppendingPathComponent("hondenvoorzieningen.json"))!)
        return session.dataTaskWithRequest(request) {
            data, response, error in
            let response = response as! NSHTTPURLResponse
            if response.statusCode == 200 {
                let results = Json.readHondenvoorzieningen(data!)
                dispatch_async(dispatch_get_main_queue()) {
                    onCompletion(results)
                }
            }
        }
    }
}

//Singleton
let service = Service()
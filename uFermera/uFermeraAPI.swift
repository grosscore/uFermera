import Siesta
import SwiftyJSON
import Foundation

let uFermeraAPI = _uFermeraAPI()

private let SwiftyJSONTransformer = ResponseContentTransformer{ JSON($0.content as Any) }

class _uFermeraAPI: Service {
    
    private let service = Service(baseURL: "http://ufermera.com/api/v1/")
    
    fileprivate init() {
        
        service.configure("**") {
            $0.pipeline[.parsing].add(SwiftyJSONTransformer, contentTypes: ["*/json"])
            $0.headers["Authorization"] = ""
        }
        
        service.configureTransformer("/products/*") {
            try [ "products": ($0.content as JSON)["results"].arrayValue.map(Product.init),
                  "next": ($0.content as JSON)["next"].stringValue ]
        }
    }
    
    var firstResource: Resource{return service.resource("/products/")}
    
}


extension TypedContentAccessors {
    var json: JSON {
        return typedContent(ifNone: JSON.null)
    }
}

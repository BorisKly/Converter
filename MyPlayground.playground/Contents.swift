import UIKit

var greeting = "Hello, playground"

var components = URLComponents()
components.scheme = "https"
components.host = "example.com"
components.path = "/api"

let querlyItems : [URLQueryItem] = [
    URLQueryItem(name: "ex1", value: "v1"),
    URLQueryItem(name: "ex2", value: "v2")
]

components.queryItems = querlyItems

components.queryItems?.append(URLQueryItem(name: "1", value: "2"))


querlyItems.forEach {
    components.queryItems?.append($0)
}

if let url = components.url {
    print(url.absoluteString)
}

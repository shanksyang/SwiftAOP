/*: 
 Swift AOP: The simplest one, no parameters call
 */


protocol InvocationHandlerProcotol {
    func action()
}

class LogHandler : InvocationHandlerProcotol {
    var target: InvocationHandlerProcotol
    init(_ target: InvocationHandlerProcotol) {
        self.target = target
    }
    
    func action() {
        print("write flow log starting")
        self.target.action()
        print("writing flow log ended")
    }
}

class ParametersHandler : InvocationHandlerProcotol {
    var target: InvocationHandlerProcotol
    init(_ target: InvocationHandlerProcotol) {
        self.target = target
    }
    
    func action() {
        print("parameters verifying starting")
        self.target.action()
    }
}

class MainHandler: InvocationHandlerProcotol {
    func action() {
        print("do real action")
    }
}

let mainObject: MainHandler = MainHandler()
let logObject: LogHandler = LogHandler(mainObject)
let paraObject = ParametersHandler(logObject)

paraObject.action()
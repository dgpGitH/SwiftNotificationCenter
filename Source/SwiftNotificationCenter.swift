//
//  Created by Charles on 2020/12/9.
//  Copyright © 2020 Charles. All rights reserved.
//

import Foundation

@discardableResult public func when(_ event: Notification.Name,
                                    do closure: @escaping (Notification) -> Swift.Void) -> NSObjectProtocol {
    return NotificationCenter.default.addObserver(forName: event, object: nil, queue: nil) { note in
        closure(note)
    }
}

@discardableResult public func when(_ event: Notification.Name, doOn queue: OperationQueue,
                                    do closure: @escaping (Notification) -> Swift.Void) -> NSObjectProtocol {
    return NotificationCenter.default.addObserver(forName: event, object: nil, queue: queue) { note in
        closure(note)
    }
}

@discardableResult public func when(_ sender: Any, does event: Notification.Name,
                                    do closure: @escaping (Notification) -> Swift.Void) -> NSObjectProtocol {
    return NotificationCenter.default.addObserver(forName: event, object: sender, queue: nil) { note in
        closure(note)
    }
}

@discardableResult public func when(_ sender: Any, does event: Notification.Name, doOn queue: OperationQueue,
                                    do closure: @escaping (Notification) -> Swift.Void) -> NSObjectProtocol {
    return NotificationCenter.default.addObserver(forName: event, object: sender, queue: queue) { note in
        closure(note)
    }
}

public func trigger(_ event: Notification.Name, on object: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {
    NotificationCenter.default.post(Notification(name: event, object: object, userInfo: userInfo))
}

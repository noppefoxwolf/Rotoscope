import UIKit

public var viewReferences: WeakObjectSet<UIView> = .init([])

public enum Rotoscope {
    public static func install() {
        UIView.enableTracking()
    }
}

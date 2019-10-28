import UIKit

public var tableViewReferences: WeakObjectSet<UITableView> = .init([])

public enum Rotoscope {
    public static func install() {
        UIView.enableTracking()
    }
}

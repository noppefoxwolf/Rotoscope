import SwiftUI
import UIKit

public extension View {
    func tagging(_ tag: Int = 1192296,
                 window: UIWindow? = UIApplication.shared.keyWindow,
                 onRetrieve: @escaping ((_ taggedView: UIView?) -> Void) = { _ in }) -> some View {
        modifier(TagModifier(tag: tag)).onAppear {
            DispatchQueue.main.async {
                let rootView = window?.rootViewController?.view
                guard let tagView = rootView?.viewWithTag(tag) as? TagView else { return }
                onRetrieve(tagView.target)
            }
        }
    }
}

struct TagModifier: ViewModifier {
    let tag: Int
    
    func body(content: Content) -> some View {
        ZStack {
            content
            Tag(tag: tag)
        }
    }
}

struct Tag: UIViewRepresentable {
    typealias UIViewType = UIView
    let tag: Int
    
    func makeUIView(context: UIViewRepresentableContext<Tag>) -> UIView {
        return TagView()
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Tag>) {
        uiView.tag = tag
        uiView.frame = .zero
        uiView.backgroundColor = .clear
    }
}

/// Musi initialize from SwiftUI.
class TagView: UIView {
    var target: UIView? {
        // UIViewRepresentable give adaptor view.
        guard let adaptor = self.superview else { return nil }
        // Access parent view.
        guard let parent = adaptor.superview else { return nil }
        // Search top view in zindex.
        guard let target = parent.subviews.first else { return nil }
        
        return target
    }
}


import Combine

@available(iOS 13.0, *)

open class DisposeObject {
    var deinitCalled: (() -> Void)?
    var cancellables: Set<AnyCancellable>

    public init() {
        self.cancellables = Set<AnyCancellable>()
    }

    deinit {
        self.cancellables.removeAll()
        deinitCalled?()
    }
}

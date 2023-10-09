import Cocoa

fileprivate extension NSTouchBar.CustomizationIdentifier {

    static let touchBar = NSTouchBar.CustomizationIdentifier("com.MIDIProMaxNextGeneration")
}

fileprivate extension NSTouchBarItem.Identifier {
    static let clown       = NSTouchBarItem.Identifier("CLOWNHONK")
    static let reez    = NSTouchBarItem.Identifier("RIZZ")
    static let boom     = NSTouchBarItem.Identifier("BOOM")
    static let hehe      = NSTouchBarItem.Identifier("HEHE")
    static let sheesh   = NSTouchBarItem.Identifier("SHEESH")
}


class WindowController: NSWindowController, NSTouchBarDelegate {

    @objc func handleFart(sender: NSButton) {
        let title = sender.title
        
        guard let sound = NSSound(named: NSSound.Name(title)) else {
            return
        }
        sound.play()
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier    = .touchBar
        touchBar.defaultItemIdentifiers     = [.clown, .reez, .boom, .hehe, .sheesh]
        
        return touchBar
    }
    
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        let touchBarItem    = NSCustomTouchBarItem(identifier: identifier)
        touchBarItem.view   = NSButton(title: identifier.rawValue, target: self, action: #selector(handleFart))
        return touchBarItem
    }
}

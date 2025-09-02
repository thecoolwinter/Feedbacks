//
//  ViewController.swift
//  Feedback-LiquidGlass-Floating-ScrollView
//
//  Created by Khan Winter on 9/2/25.
//

import Cocoa

class ViewController: NSViewController, NSToolbarDelegate {
    var scrollView: NSScrollView!
    var content: NSView!
    var floating: NSView!
    var toolbar: NSToolbar!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear() {
        super.viewDidAppear()
        toolbar = NSToolbar()
        toolbar.delegate = self
        view.window?.toolbar = toolbar
        view.window?.titlebarAppearsTransparent = true
        view.window?.styleMask.insert(.fullSizeContentView)
        view.window?.title = "Feedback Liquid Glass Scroll Views"
        view.window?.toolbarStyle = .unified
    }

    override func loadView() {
        super.loadView()

        scrollView = NSScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = true

        content = NSView()
        content.frame = NSRect(x: 0, y: 0, width: 1000, height: 1000)
        content.wantsLayer = true
        content.layer?.backgroundColor = NSColor.blue.cgColor

        floating = NSView()
        floating.frame = NSRect(x: 0, y: 0, width: 100, height: 1000)
        floating.wantsLayer = true
        floating.layer?.backgroundColor = NSColor.red.cgColor

        scrollView.documentView = content
        scrollView.addFloatingSubview(floating, for: .horizontal)

        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        scrollView.automaticallyAdjustsContentInsets = false
        scrollView.contentInsets = NSEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
    }

    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [
            .showColors,
            .flexibleSpace,
            .print,
            .flexibleSpace,
            .cloudSharing
        ]
    }

    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [
            .showColors,
            .flexibleSpace,
            .print,
            .cloudSharing
        ]
    }

    func toolbar(
        _ toolbar: NSToolbar,
        itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
        willBeInsertedIntoToolbar flag: Bool
    ) -> NSToolbarItem? {
        NSToolbarItem(itemIdentifier: itemIdentifier)
    }
}


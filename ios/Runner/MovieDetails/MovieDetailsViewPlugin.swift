//
//  MoviePlugin.swift
//  Runner
//
//  Created by Lobna Shaheen on 10/05/2022.
//

class MovieDetailsViewPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = MovieDetailsViewFactory(messenger: registrar.messenger())
        registrar.register(factory, withId: "<platform-view-type>")
    }
}

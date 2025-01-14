#if canImport(ContentsquareModule)
@_exported import ContentsquareModule
#endif

#if canImport(HeapContentsquareIntegrationSDK) && canImport(HeapContentsquareIntegrationImplementation)
@_exported import HeapContentsquareIntegrationSDK
#elseif canImport(HeapContentsquareIntegrationSDK_static) && canImport(HeapContentsquareIntegrationImplementation)
@_exported import HeapContentsquareIntegrationSDK_static
#endif

#if canImport(HeapIOSAutocaptureImplementation) && canImport(HeapIOSAutocapture)
@_exported import HeapIOSAutocapture
#endif


#if canImport(HeapNotificationAutocaptureImplementation) && canImport(HeapNotificationAutocapture)
@_exported import HeapNotificationAutocapture
#endif

@_exported import HeapSwiftCore

@objc(CSQIsInstalled) internal class Dummy: NSObject {}

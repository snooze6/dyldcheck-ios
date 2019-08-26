//
//  ViewController.swift
//  dyldcheck
//
//  Created by Snooze on 23/08/2019.
//  Copyright © 2019 Snooze. All rights reserved.
//

import UIKit
import Security

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var showall: UISwitch!
    @IBOutlet weak var topbar: UINavigationBar!
    @IBOutlet weak var bottombar: UINavigationBar!
    @IBOutlet var iview: UIView!
    @IBOutlet weak var iswitch: UISwitch!
    
    var showingLibs = [String]()
    var libs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        iswitch.setOn(false, animated: true)

        table.translatesAutoresizingMaskIntoConstraints = false
        let guide = iview.safeAreaLayoutGuide;
        table.topAnchor.constraint(equalTo: topbar.bottomAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: bottombar.topAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: guide.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: guide.rightAnchor).isActive = true

        libs = getLibNames()
        showingLibs = libs
        //dumpLibs(libs: getLibNames())
    }

    @IBAction func pushed(_ sender: Any) {
        let value = !showall.isOn
        if (value){
            showingLibs = getLibNames()
        } else {
            let libs = getLibNames()
            showingLibs = [String]()
            for lib in libs{
                if !whitelist.contains(lib){
                    showingLibs.append(lib)
                    NSLog("New library found: "+lib)
                }
            }
            if showingLibs.count == 0{
                showingLibs.append("None")
            }
        }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showingLibs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text  = showingLibs[indexPath.row]
        return cell
    }
    
    func dumpLibs(libs: [String]){
        var ret = "[\n"
        for lib in libs{
            ret += "\""+lib+"\",\n"

        }
        ret = String(ret.dropLast(2))
        ret+="\n]"
        print(ret)
    }
    
    let whitelist = [
        "dyld_sim",
        "dyldcheck",
        "libBacktraceRecording.dylib",
        "libMainThreadChecker.dylib",
        "libViewDebuggerSupport.dylib",
        "Foundation",
        "libobjc.A.dylib",
        "libSystem.B.dylib",
        "UIKit",
        "libswiftCore.dylib",
        "libswiftCoreFoundation.dylib",
        "libswiftCoreGraphics.dylib",
        "libswiftCoreImage.dylib",
        "libswiftDarwin.dylib",
        "libswiftDispatch.dylib",
        "libswiftFoundation.dylib",
        "libswiftMetal.dylib",
        "libswiftObjectiveC.dylib",
        "libswiftQuartzCore.dylib",
        "libswiftSwiftOnoneSupport.dylib",
        "libswiftUIKit.dylib",
        "MobileCoreServices",
        "libarchive.2.dylib",
        "libicucore.A.dylib",
        "libxml2.2.dylib",
        "libz.1.dylib",
        "CoreFoundation",
        "CFNetwork",
        "SystemConfiguration",
        "IOKit",
        "libCRFSuite.dylib",
        "liblangid.dylib",
        "CoreServices",
        "libc++.1.dylib",
        "MobileInstallation",
        "libMobileGestalt.dylib",
        "libbsm.0.dylib",
        "Security",
        "libc++abi.dylib",
        "libcache.dylib",
        "libcommonCrypto.dylib",
        "libcompiler_rt.dylib",
        "libcopyfile.dylib",
        "libcorecrypto.dylib",
        "libdispatch.dylib",
        "libdyld.dylib",
        "liblaunch.dylib",
        "libmacho.dylib",
        "libremovefile.dylib",
        "libsystem_asl.dylib",
        "libsystem_blocks.dylib",
        "libsystem_c.dylib",
        "libsystem_configuration.dylib",
        "libsystem_containermanager.dylib",
        "libsystem_coreservices.dylib",
        "libsystem_darwin.dylib",
        "libsystem_dnssd.dylib",
        "libsystem_info.dylib",
        "libsystem_m.dylib",
        "libsystem_malloc.dylib",
        "libsystem_notify.dylib",
        "libsystem_sandbox.dylib",
        "libsystem_sim_kernel.dylib",
        "libsystem_sim_platform.dylib",
        "libsystem_sim_pthread.dylib",
        "libsystem_trace.dylib",
        "libunwind.dylib",
        "libxpc.dylib",
        "libsystem_sim_pthread_host.dylib",
        "libsystem_sim_platform_host.dylib",
        "libsystem_sim_kernel_host.dylib",
        "libsystem_kernel.dylib",
        "libsystem_platform.dylib",
        "libsystem_pthread.dylib",
        "MobileSystemServices",
        "libbz2.1.0.dylib",
        "libnetwork.dylib",
        "libcoretls.dylib",
        "libcoretls_cfhelpers.dylib",
        "libapple_nghttp2.dylib",
        "libsqlite3.dylib",
        "liblzma.5.dylib",
        "DocumentManager",
        "FileProvider",
        "UIKitCore",
        "MobileIcons",
        "QuartzCore",
        "Network",
        "DocumentManagerCore",
        "CoreGraphics",
        "PlugInKit",
        "CoreImage",
        "CoreUI",
        "ImageIO",
        "AggregateDictionary",
        "libFosl_dynamic.dylib",
        "ColorSync",
        "CoreMedia",
        "VideoToolbox",
        "GraphVisualizer",
        "CoreText",
        "OpenGLES",
        "Accelerate",
        "CoreVideo",
        "FaceCore",
        "SimulatorClient",
        "CoreAudio",
        "vImage",
        "vecLib",
        "libcompression.dylib",
        "libvMisc.dylib",
        "libvDSP.dylib",
        "libBLAS.dylib",
        "libLAPACK.dylib",
        "libLinearAlgebra.dylib",
        "libSparseBLAS.dylib",
        "libQuadrature.dylib",
        "libBNNS.dylib",
        "libSparse.dylib",
        "GraphicsServices",
        "libGSFontCache.dylib",
        "UIFoundation",
        "libAccessibility.dylib",
        "OTSVG",
        "FontServices",
        "libFontParser.dylib",
        "TextureIO",
        "Metal",
        "libate.dylib",
        "IOSurface",
        "AppleJPEG",
        "libCoreFSCache.dylib",
        "libGFXShared.dylib",
        "libGLImage.dylib",
        "libCVMSPluginSupport.dylib",
        "libCoreVMClient.dylib",
        "libLLVMContainer.dylib",
        "AXCoreUtilities",
        "MediaAccessibility",
        "ConstantClasses",
        "AppleSauce",
        "XCTTargetBootstrap",
        "WebKitLegacy",
        "JavaScriptCore",
        "UserNotifications",
        "AppSupport",
        "AssertionServices",
        "BackBoardServices",
        "BaseBoard",
        "FrontBoardServices",
        "MobileAsset",
        "PhysicsKit",
        "ProofReader",
        "PrototypeTools",
        "TextInput",
        "UIKitServices",
        "WebCore",
        "libwebrtc.dylib",
        "URLFormatting",
        "AudioToolbox",
        "CorePhoneNumbers",
        "libAudioStatistics.dylib",
        "ProtocolBuffer",
        "WirelessDiagnostics",
        "RTCReporting",
        "SpringBoardServices",
        "TCC",
        "libAWDSupportFramework.dylib",
        "libprotobuf-lite.dylib",
        "libTelephonyUtilDynamic.dylib",
        "libprotobuf.dylib",
        "StreamingZip",
        "Lexicon",
        "LanguageModeling",
        "LinguisticData",
        "CoreEmoji",
        "libcmph.dylib",
        "libiconv.2.dylib",
        "libcharset.1.dylib",
        "CoreNLP",
        "libmecab_em.dylib",
        "libgermantok.dylib",
        "libThaiTokenizer.dylib",
        "libChineseTokenizer.dylib",
        "Accounts",
        "AppleAccount",
        "CoreData",
        "ManagedConfiguration",
        "SetupAssistant",
        "AppleIDSSOAuthentication",
        "ApplePushService",
        "AuthKit",
        "CoreLocation",
        "StoreServices",
        "DataMigration",
        "PersistentConnection",
        "CoreTelephony",
        "CommonUtilities",
        "Bom",
        "libcupolicy.dylib",
        "CoreTime",
        "CoreUtils",
        "AppleIDAuthSupport",
        "PhoneNumbers",
        "ROCKit",
        "AccountsDaemon",
        "IDS",
        "GSS",
        "OAuth",
        "Marco",
        "IMFoundation",
        "IDSFoundation",
        "Engram",
        "DiagnosticLogCollection",
        "libtidy.A.dylib",
        "CoreBluetooth",
        "libheimdal-asn1.dylib",
        "Heimdal",
        "libresolv.9.dylib",
        "CommonAuth",
        "GeoServices",
        "CoreLocationProtobuf",
        "CacheDelete",
        "AppleMediaServices",
        "CoreSymbolication",
        "DebugHierarchyFoundation",
        "GLKit",
        "MapKit",
        "SceneKit",
        "ContactsUI",
        "Contacts",
        "AppSupportUI",
        "SearchFoundation",
        "Intents",
        "AddressBookLegacy",
        "Navigation",
        "VectorKit",
        "DataAccessExpress",
        "PersonaKit",
        "PersonaUI",
        "AVFoundation",
        "CoreSpotlight",
        "CommunicationsFilter",
        "ContactsDonation",
        "ContactsFoundation",
        "ContactsUICore",
        "IntlPreferences",
        "TelephonyUtilities",
        "vCard",
        "libCTGreenTeaLogger.dylib",
        "InternationalSupport",
        "AVFAudio",
        "MediaToolbox",
        "Celestial",
        "MetadataUtilities",
        "CellularPlanManager",
        "CoreDuet",
        "CoreRecents",
        "CoreDuetContext",
        "CoreAnalytics",
        "CoreDuetDebugLogging",
        "CloudKit",
        "CoreDuetDaemonProtocol",
        "Rapport",
        "StatsKit",
        "ProtectedCloudStorage",
        "IntentsFoundation",
        "IncomingCallFilter",
        "ModelIO",
        "MetalKit",
        "libMobileGestaltExtensions.dylib",
        "libobjc-trampolines.dylib",
        "libTrueTypeScaler.dylib"
    ]
    
}


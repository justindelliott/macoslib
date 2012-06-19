#tag Class
Class NSNetService
Inherits NSObject
	#tag Method, Flags = &h0
		Function Addresses() As String()
		  //# Return an array of all the addresses available to communicate with the distant service
		  
		  #if TargetMacOS
		    declare function addresses lib CocoaLib selector "addresses" (id as Ptr) as Ptr
		    
		    dim nsa as NSArray = new NSArray( addresses( me.id ), false )
		    dim nsd as NSData
		    dim result() as string
		    
		    DReportTitle  "Adresses:"
		    
		    for i as integer=0 to nsa.Count - 1
		      nsd = new NSData( nsa.Value( i ))
		      result.Append  sockaddrToString( nsd.Data )
		    next
		    
		    DReport  result
		    
		    return   result
		  #endif
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DataFromTXTRecordDictionary(dict as NSDictionary) As NSData
		  
		  #if TargetMacOS
		    declare function _dataFromTXTRecordDictionary lib CocoaLib selector "dataFromTXTRecordDictionary:" ( Cls as Ptr, data as ptr ) as Ptr
		    
		    dim p as Ptr
		    
		    if dict=nil then
		      return  nil
		    end if
		    
		    p = _dataFromTXTRecordDictionary( Cocoa.NSClassFromString( "NSNetService" ), dict.id )
		    
		    if p<>nil then
		      return  new NSData( p, false )
		    else
		      return  nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidNotPublish(id as Ptr, sel as Ptr, cntl as Ptr, err as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      dim NSdict as NSDictionary = new NSDictionary( err, false )
		      dim dict as Dictionary = NSDict.VariantValue
		      
		      obj.HandleDidNotPublish   dict
		      DReport  CurrentMethodName, Hex( id ), "fired"
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidNotResolve(id as Ptr, sel as Ptr, cntl as Ptr, err as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      dim NSdict as NSDictionary = new NSDictionary( err, false )
		      dim dict as Dictionary = NSDict.VariantValue
		      
		      obj.HandleDidNotResolve  dict
		      DReport  CurrentMethodName, Hex( id ), "fired"
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidPublish(id as Ptr, sel as Ptr, cntl as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleDidPublish
		      DReport  CurrentMethodName, Hex( id ), "fired"
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidResolve(id as Ptr, sel as Ptr, cntl as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleDidResolve
		      DReport  CurrentMethodName, Hex( id ), "fired"
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidStop(id as Ptr, sel as Ptr, cntl as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleDidStop
		      DReport  CurrentMethodName, Hex( id ), "fired"
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidUpdateTXTRecord(id as Ptr, sel as Ptr, cntl as Ptr, dataPtr as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      'dim data as NSData = new NSData( dataPtr, false )
		      obj.HandleDidUpdateTXTRecord
		      DReport  CurrentMethodName, Hex( id ), "fired"
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_WillPublish(id as Ptr, sel as Ptr, cntl as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleWillPublish
		      DReport  CurrentMethodName, Hex( id ), "fired"
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_WillResolve(id as Ptr, sel as Ptr, cntl as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleWillResolve
		      DReport  CurrentMethodName, Hex( id ), "fired"
		      
		    else
		      Raise new macoslibException( "Target object no longer exists." )
		    end if
		  else
		    Raise new macoslibException( "Target object not found." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DictionaryFromTXTRecordData(data as NSData) As NSDictionary
		  
		  #if TargetMacOS
		    declare function _dictionaryFromTXTRecordData lib CocoaLib selector "dictionaryFromTXTRecordData:" ( Cls as Ptr, data as ptr ) as Ptr
		    
		    dim p as Ptr
		    
		    p = _dictionaryFromTXTRecordData( Cocoa.NSClassFromString( "NSNetService" ), data.id )
		    
		    if p<>nil then
		      return  new NSDictionary( p, false )
		    else
		      return  nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Domain() As String
		  
		  #if TargetMacOS
		    declare function _domain lib CocoaLib selector "domain" (id as Ptr) as CFStringRef
		    
		    return  _domain( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As NSSearchField
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return NSSearchField(w.Value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FPtr(p as Ptr) As Ptr
		  //This function is a workaround for the inability to convert a Variant containing a delegate to Ptr:
		  //dim v as Variant = AddressOf Foo
		  //dim p as Ptr = v
		  //results in a TypeMismatchException
		  //So now I do
		  //dim v as Variant = FPtr(AddressOf Foo)
		  //dim p as Ptr = v
		  
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidNotPublish(errDict as Dictionary)
		  mState = kStateIsServer
		  
		  RaiseEvent   DidNotPublish( errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 ))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidNotResolve(errDict as Dictionary)
		  RaiseEvent   DidNotResolve( errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 ))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidPublish()
		  mState = kStatePublished
		  
		  RaiseEvent   DidPublish
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidResolve()
		  mState = kStateResolved
		  
		  RaiseEvent  DidResolve
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidStop()
		  if State=kStateIsResolving then
		    RaiseEvent   DidStopResolving
		    
		  elseif State=kStateIsTryingToPublish OR State=kStatePublished OR State=kStateIsTryingToUnpublish then
		    RaiseEvent   DidStopPublishing
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidUpdateTXTRecord()
		  RaiseEvent   DidUpdateTXTRecord
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWillPublish()
		  RaiseEvent   WillPublish
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWillResolve()
		  RaiseEvent   WillResolve
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HostName() As String
		  
		  #if TargetMacOS
		    declare function _hostname lib CocoaLib selector "hostName" (id as Ptr) as CFStringRef
		    
		    return  _hostname( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function InitForPublishing(name as String, domain as string, type as string, port as integer) As NSNetService
		  
		  #if TargetMacOS
		    declare function initWithDomain lib CocoaLib selector "initWithDomain:type:name:port:" ( id as Ptr, domain as CFStringRef, type as CFStringRef, name as CFStringRef, port as Integer ) as Ptr
		    
		    dim p as Ptr = NSObject.Allocate( "NSNetService" )
		    dim nsns as NSNetService
		    
		    p = initWithDomain( p, domain, type, name, port )
		    
		    if p<>nil then
		      nsns = new NSNetService( p, false )
		      nsns.mState = kStateIsServer
		      nsns.SetDelegate
		      return  nsns
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function InitForResolving(name as String, domain as string, type as string) As NSNetService
		  
		  #if TargetMacOS
		    declare function initWithDomain lib CocoaLib selector "initWithDomain:type:name:" ( id as Ptr, domain as CFStringRef, type as CFStringRef, name as CFStringRef ) as Ptr
		    
		    dim p as Ptr = NSObject.Allocate( "NSNetService" )
		    dim nsns as NSNetService
		    
		    p = initWithDomain( p, domain, type, name )
		    
		    if p<>nil then
		      nsns = new NSNetService( p, false )
		      nsns.mState = kStateIsClient
		      nsns.SetDelegate
		      return  nsns
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  #if targetCocoa
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      raise new ObjCException
		      return nil
		    end if
		    
		    DReport   CurrentMethodName, "executing"
		    
		    objc_registerClassPair newClassId
		    
		    dim methodList() as Tuple
		    methodList.Append  "netService:didNotPublish:" : FPtr( AddressOf  delegate_DidNotPublish ) : "v@:@@"
		    methodList.Append  "netService:didNotResolve:" : FPtr( AddressOf  delegate_DidNotResolve ) : "v@:@@"
		    methodList.Append  "netService:didUpdateTXTRecordData:" : FPtr( AddressOf  delegate_DidUpdateTXTRecord ) : "v@:@@"
		    methodList.Append  "netServiceDidPublish:" : FPtr( AddressOf delegate_DidPublish ) : "v@:@"
		    methodList.Append  "netServiceDidResolveAddress:" : FPtr ( AddressOf delegate_DidResolve ) : "v@:@"
		    methodList.Append  "netServiceDidStop:" : FPtr( AddressOf delegate_DidStop ) : "v@:@"
		    methodList.Append  "netServiceWillPublish:" : FPtr( AddressOf delegate_WillPublish ) : "v@:@"
		    methodList.Append  "netServiceWillResolve:" : FPtr( AddressOf delegate_WillResolve ) : "v@:@"
		    
		    dim methodsAdded as Boolean = true
		    for each item as Tuple in methodList
		      if NOT class_addMethod(newClassId, Cocoa.NSSelectorFromString(item(0)), item(1), item(2)) then
		        Raise new ObjCException
		      end if
		    next
		    
		    if methodsAdded then
		      return newClassId
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  
		  #if TargetMacOS
		    declare function _name lib CocoaLib selector "name" (id as Ptr) as CFStringRef
		    
		    return  _name( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Port() As integer
		  
		  #if TargetMacOS
		    declare function _port lib CocoaLib selector "port" (id as Ptr) as integer
		    
		    return  _port( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Private_SetParent(bc as BonjourControl)
		  
		  #if TargetMacOS
		    parent = new WeakRef( bc )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Publish(allowAutoRenaming as boolean = true)
		  
		  #if TargetMacOS
		    declare sub _publish lib CocoaLib selector "publish" ( id as Ptr )
		    'declare sub _publishWithOptions lib CocoaLib selector "publishWithOptions:" ( id as Ptr, opt as integer )
		    
		    '_publishWithOptions  me.id, IFTE( allowAutoRenaming, 0, 1 )
		    _publish me.id
		    mState = kStateIsTryingToPublish
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFromRunLoop()
		  
		  #if TargetMacOS
		    declare sub removeFromRunLoop lib CocoaLib selector "removeFromRunLoop:forMode:" ( id as Ptr, aRunLoop as Ptr, mode as CFStringRef )
		    
		    dim nsrl as NSRunLoop = NSRunLoop.Current
		    
		    removeFromRunLoop   me.id, nsrl.id, Cocoa.StringConstant( "NSRunLoopCommonModes" )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resolve(timeoutInSeconds as double)
		  
		  #if TargetMacOS
		    declare sub resolveWithTimeout lib CocoaLib selector "resolveWithTimeout:" ( id as Ptr, timeout as double )
		    
		    mState = kStateIsResolving
		    resolveWithTimeout   me.id, timeoutInSeconds
		    
		    DReport   CurrentMethodName, "fired"
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScheduleInRunLoop()
		  
		  #if TargetMacOS
		    declare sub scheduleInRunLoop lib CocoaLib selector "scheduleInRunLoop:forMode:" ( id as Ptr, aRunLoop as Ptr, mode as CFStringRef )
		    
		    dim nsrl as NSRunLoop = NSRunLoop.Main
		    
		    scheduleInRunLoop   me.id, nsrl.id, Cocoa.StringConstant( "NSDefaultRunLoopMode" )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDelegate()
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    
		    dim delegate_id as Ptr = init(alloc(DelegateClassID))
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function sockaddrToString(sockaddr as MemoryBlock) As string
		  
		  dim result as string
		  dim components() as string
		  dim port as integer
		  
		  sockaddr.LittleEndian = false
		  port = sockaddr.UInt16Value( 2 )
		  
		  select case sockaddr.Byte( 1 )
		  case 2 //IPv4
		    for i as integer = 4 to 7
		      components.Append   Str( sockaddr.Byte( i ))
		    next
		    result = Join( components, "." ) + ":" + Str( port )
		    
		  case 30 //IPv6
		    for i as integer = 8 to 22 step 2
		      if sockaddr.UInt16Value( i )=0 then
		        components.Append  ""
		      else
		        components.Append  Hex( sockaddr.UInt16Value( i ))
		      end if
		    next
		    //WARNING: this is not completely correct as only one "::" is allowed
		    result = "[" + Join( components, ":" ) + "]:" + Str( port )
		    
		  else
		    return ""
		    
		  end select
		  
		  return  result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartMonitoring()
		  
		  #if TargetMacOS
		    declare sub _StartMonitoring lib CocoaLib selector "startMonitoring" (id as Ptr)
		    
		    if State=kStateResolved then
		      _StartMonitoring   me.id
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  
		  #if TargetMacOS
		    declare sub _stop lib CocoaLib selector "stop" (id as Ptr)
		    
		    if State>=kStateIsServer then
		      mState = kStateIsTryingToUnpublish
		    else
		      mState = kStateIsResolving
		    end if
		    _stop  me.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopMonitoring()
		  
		  #if TargetMacOS
		    declare sub _StopMonitoring lib CocoaLib selector "stopMonitoring" (id as Ptr)
		    
		    if State=kStateResolved then
		      _StopMonitoring   me.id
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As String
		  
		  #if TargetMacOS
		    declare function _type lib CocoaLib selector "type" (id as Ptr) as CFStringRef
		    
		    return  _type( me.id )
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidNotPublish(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidNotResolve(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidPublish()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidResolve()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidStopPublishing()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidStopResolving()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidUpdateTXTRecord()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillPublish()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillResolve()
	#tag EndHook


	#tag Note, Name = Documentation
		The NSNetService object allows you to register a network service on the network or detect computers which provide the service you are looking for.
		
		DECLARING A SERVICE ON THE NETWORK: First create you Socket of ServerSocket to manage incoming connections. The create a NSNetService instance
		   with the shared method "InitForPublishing" and call "Publish". You will get the confirmation that your service has been properly registered in the
		   "DidPublish" event. If an error occurred, you will receive the error code in the "DidNotPublish" event.
		
		DETECTING A SERVICE ON THE NETWORK: see Documentation in the NSNetServiceBrowser class
		
		USING A SERVICE ON THE NETWORK: you do not need to use NSNetServiceBrowser to get a functional NSNetService that you can also create using the name,
		   type and domain of a service (if you know them) with the "InitForResolving" shared method
		
		CONNECTING TO A SERVICE: no matter how you get a NSNetService object, you first need to resolve the actual address(es) of the service. Depending on how many interfaces
		   are active (1 or 2 Ethernet cards, the WiFi network...) you will get a number of IPv4 and IPv6 addresses. Fortunately, you do not need to pick one when using
		   NSNetService.
	#tag EndNote


	#tag Property, Flags = &h21
		Private mState As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		parent As Weakref
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    dim data as NSData
			    dim nsd as NSDictionary
			    
			    data = me.TXTData
			    nsd = NSNetService.DictionaryFromTXTRecordData( data )
			    
			    if nsd<>nil then
			      return   nsd.VariantValue
			    else
			      return  new Dictionary
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    dim data as NSData
			    dim nsd as NSDictionary = NSDictionary.CreateFromRSDictionary( value )
			    
			    data = NSNetService.DataFromTXTRecordDictionary( nsd )
			    
			    me.TXTData = data
			  #endif
			End Set
		#tag EndSetter
		ServiceTXTDictionary As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mState
			End Get
		#tag EndGetter
		State As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function TXTRecordData lib CocoaLib selector "TXTRecordData" (id as Ptr) as Ptr
			    
			    dim p as Ptr = TXTRecordData( me.id )
			    if p<>nil then
			      return   new NSData( p, false )
			    else
			      return nil
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare function TXTRecordData lib CocoaLib selector "setTXTRecordData:" (id as Ptr, data as Ptr) as boolean
			    
			    dim OK as Boolean
			    
			    if value = nil then
			      OK = TXTRecordData( me.id, nil )
			    else
			      OK = TXTRecordData( me.id, value.id )
			    end if
			    
			    if not OK then
			      break
			    end if
			  #endif
			End Set
		#tag EndSetter
		TXTData As NSData
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSNetServiceDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesActivityInProgress, Type = Double, Dynamic = False, Default = \"-72003", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesBadArgumentError, Type = Double, Dynamic = False, Default = \"-72004", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesCancelledError, Type = Double, Dynamic = False, Default = \"-72005", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesCollisionError, Type = Double, Dynamic = False, Default = \"-72001", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesInvalidError, Type = Double, Dynamic = False, Default = \"-72006", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesNotFoundError, Type = Double, Dynamic = False, Default = \"-72002", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesTimeoutError, Type = Double, Dynamic = False, Default = \"-72007", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesUnknownError, Type = Double, Dynamic = False, Default = \"-72000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateIsClient, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateIsResolving, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateIsServer, Type = Double, Dynamic = False, Default = \"100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateIsTryingToPublish, Type = Double, Dynamic = False, Default = \"101", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateIsTryingToUnpublish, Type = Double, Dynamic = False, Default = \"103", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStatePublished, Type = Double, Dynamic = False, Default = \"102", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateResolved, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
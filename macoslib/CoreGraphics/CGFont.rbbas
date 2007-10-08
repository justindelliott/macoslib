#tag ClassClass CGFontInherits CFType	#tag Method, Flags = &h0		 Shared Function ClassID() As UInt32		  soft declare function CGFontGetTypeID lib CarbonFramework () as UInt32		  		  return CGFontGetTypeID		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function CanCreatePostScriptSubset(format as CGFontPostScriptFormat) As Boolean		  soft declare function CGFontCanCreatePostScriptSubset lib CarbonFramework (font as Ptr, format as CGFontPostScriptFormat) as Boolean		  		  return CGFontCanCreatePostScriptSubset(me, format)		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function VariationAxes() As CFArray		  soft declare function CGFontCopyVariationAxes lib CarbonFramework (font as Ptr) as Ptr		  		  dim theArray as CFArray = CGFontCopyVariationAxes(me)		  if theArray = nil then //font does not support variations		    return nil		  else		    return theArray		  end if		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function Variations() As CFDictionary		  soft declare function CGFontCopyVariations lib CarbonFramework (font as Ptr) as Ptr		  		  dim d as CFDictionary  = CGFontCopyVariations(me)		  if d = nil then //font does not support variations		    return nil		  else		    return d		  end if		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function Clone(variations as CFDictionary) As CGFont		  if variations is nil then		    dim oops as new NilObjectException		    oops.Message = "CGFont.Clone: variations cannot be nil."		    raise oops		  end if		  		  soft declare function CGFontCreateCopyWithVariations lib CarbonFramework (font as Ptr, variations as Ptr) as Ptr		  		  dim copy as CGFont = CGFontCreateCopyWithVariations(me, variations)		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function Create(font as ATSFont) As CGFont		  if font is nil then		    return nil		  end if		  		  #if targetMacOS		    soft declare function CGFontCreateWithPlatformFont lib CarbonFramework (ByRef platformFontReference as UInt32) as Ptr		    		    dim fontRef as UInt32 = font		    dim theCGFont as CGFont = CGFontCreateWithPlatformFont(fontRef)		    if theCGFont <> nil then		      return theCGFont		    else		      return nil		    end if		  #endif		End Function	#tag EndMethod	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			soft declare function CGFontCopyPostScriptName lib CarbonFramework (font as Ptr) as CFStringRef						return CGFontCopyPostScriptName(me)			End Get		#tag EndGetter		PostScriptName As String	#tag EndComputedProperty	#tag ViewBehavior		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="PostScriptName"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass
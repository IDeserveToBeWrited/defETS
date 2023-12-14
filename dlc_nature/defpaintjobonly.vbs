' *****************************************************************************
' VEHICLE DEF PART_TYPE ADDER 1.0 by SiSL
' -----------------------------------------------------------------------------
' This script copies example sii files done for a sample truck to all trucks
' Needs to be placed on slot def folder and run from there
' ex: /def/vehicle/truck/renault.t/accessory/toyhang
' It copies all sii files in that folder to all other trucks, replaced tokens
' Only use under mods
' *****************************************************************************


Dim fso: set fso = CreateObject("Scripting.FileSystemObject")

Dim currentPath : currentPath = fso.GetAbsolutePathName(".")

defaultPartType = "aftermarket" ' // aftermarket. factory, licensed and unknown
defaultPaintJobType = "aftermarket"
defaultToyType = "aftermarket"
defaultSteamItem = "aftermarket"

Dim overwrite: overwrite = True

dim toydirs
toydirs = Array("b_grill", "f_grill", "r_grill", "beacon", "exhaust_l", "exhaust_r", "flag_f_l", "flag_f_r", "trlr_cables", "sideskrt_bar", "codrv_plate", "drv_plate", "l_pillow", "set_cabinet", "table", "toytable", "toysofa", "set_dashbrd", "set_glass", "toybed", "toysofa", "toytable", "toyseat", "toyhang", "toybig", "toystand", "set_cuphold", "set_cabinet", "cabflares", "horns", "cup_holder")


Dim changeHorns: changeHorns = false 

' Get Official Truck List and locations

Dim q : q=msgbox("Do you want to start adding part_type to all accessory_addons?",3 + 48, "Part_type Adder")

if q = 2 Then 
    Wscript.Quit 
End If 


    
Dim allSIIList 
allSIIList  = ""

Call getSubFolders(fso.GetFolder("."))
allsii = Split(allSIIList,"/")


    For sii=0 to UBound(allSii)
        currentSii = OkuBeni(allSii(sii))
        checkSii = currentSii 
        Set re = New RegExp
        With re
            .Pattern    = "accessory_[^\{]([^\}]+)\}"
            .IgnoreCase = true 
            .Global     = true
        End With

        if re.Test(currentSii) Then 
            Set matches = re.Execute(currentSii)

            For each match in matches
                fulldataOriginal = match.value

                If InStr(fulldataOriginal,"icon:") AND InStr(fulldataOriginal,"price:") Then 
                    if InStr(fulldataOriginal,"part_type:") AND overwrite = False Then 

                    Else 
                        newSII = fulldataOriginal
                       
                        if Instr(currentSii,"accessory_paint_job_data") Then 
                        	
                        		 if overwrite = True Then 
                            		newSII = regReplace(newSII, "(part_type\:[^\r\n]+\r\n)","")
                        	End If 
                        	
                            if InStr(fulldataOriginal,"steam_inventory_id") Then 
                                newSII = regReplace(newSII, "(icon\:[^\r\n]+)","$1" & vbNewLine & vbTab & "part_type: " & defaultPaintJobType)
                            Else 
                                newSII = regReplace(newSII, "(icon\:[^\r\n]+)","$1" & vbNewLine & vbTab & "part_type: " & defaultSteamItem)
                            End If
                        Else
                           
                        End If
                        currentSii = Replace(currentSii,fulldataOriginal,newSII)

                    End If
                End If

            Next 
            
            if currentSii <> checkSii Then 
                Call YazBeni(currentSii,allSii(sii))    
            End If 

        Else 
         if InStr(allSii(sii),"paint_job") AND InStr(allSii(sii),"_settings.sui") Then 
           
            fulldataOriginal = currentSii
            newSII = fulldataOriginal
             if overwrite = True Then 
                newSII = regReplace(newSII, "(part_type\:[^\r\n]+\r\n)","")
            End If 
            if InStr(fulldataOriginal,"steam_inventory_id") Then 
                                newSII = regReplace(newSII, "(icon\:[^\r\n]+)","$1" & vbNewLine & vbTab & "part_type: " & defaultPaintJobType)
                            Else 
                                newSII = regReplace(newSII, "(icon\:[^\r\n]+)","$1" & vbNewLine & vbTab & "part_type: " & defaultSteamItem)
                            End If
            currentSii = Replace(currentSii,fulldataOriginal,newSII)

            if currentSii <> checkSii Then 
                Call YazBeni(currentSii,allSii(sii))    
            End If 

         End If

        
        
        End If



        
    Next

    MsgBox "     Part Types Added", vbInformation , "Completed"



function IsToy(directory,content) 
    toy = false 
    
    For td=0 to UBound(toydirs)
        if InStr(directory,"\" & toydirs(td) & "\") Then 
            toy = true
        End If
    Next
    
    For td=0 to UBound(toydirs)
        if InStr(content,"suitable_for[]: " & chr(34) & toydirs(td) & chr(34)) Then 
            toy = true 
        End If
    Next
    
    IsToy = toy 
end function



function findSVNroot(folder)
    ptempPath = folder 
    Do while (fso.FileExists(ptempPath & "\fstab") = False AND fso.FolderExists(ptempPath & "\.svn") = False)
        ptempPath = fso.GetParentFolderName(ptempPath)
    Loop 
   findSVNroot = ptempPath
end function 

function findMainFolder(folder)
    ptempPath = folder 
    Do while (fso.FolderExists(ptempPath & "\def") = False)
        ptempPath = fso.GetParentFolderName(ptempPath)
    Loop 
   findMainFolder = ptempPath
end function 

function findModFolder(folder)
    ptempPath = findMainFolder(folder)
    findModFolder = fso.GetParentFolderName(ptempPath)
end function 

function getTrucks(folder)
    mFolder = findSVNroot(folder)

    Set f = fso.GetFolder( mFolder)
    Set fc = f.SubFolders
    For Each f1 in fc
       
        If (f1.name = "base_vehicle" OR Left(f1.name,4) = "dlc_") Then 
            If fso.FolderExists(mFolder & "\" & f1.name & "\def\vehicle\truck") Then 
                Set tf = fso.GetFolder( mFolder & "\" & f1.name & "\def\vehicle\truck" )
                Set tfc = tf.SubFolders
                For each tf1 in tfc 
                    If fso.FileExists(mFolder & "\" & f1.name & "\def\vehicle\truck\" &  tf1.name & "\data.sii") Then 
                       If IsEmpty(truckList) Then 
                            Redim Preserve truckList(0)               
                        Else 
                            Redim Preserve truckList(Ubound(truckList) + 1)
                        End If 
                        
                        
                            
                       truckList(UBound(truckList)) = f1.name & "\" & tf1.name
                    'Wscript.Echo f1.name & "\" & tf1.name
                    End If
                Next

                
            End If

        End If        
    Next


end function 

Function OkuBeni(dosya)
        
            Set objStreamrm = CreateObject("ADODB.Stream")
            objStreamrm.Type = 2
            objStreamrm.Charset = "UTF-8"
            objStreamrm.Open

            objStreamrm.LoadFromFile(dosya)
            objStreamrm.Position = 0
            OkuBeni =  objStreamrm.ReadText()
        

End Function 

Function YazBeni(strString,filename)
							Set objStream = CreateObject("ADODB.Stream")
							Set objStream2 = CreateObject("ADODB.Stream")
							objStream2.Type = 1
							objStream.Open
							objStream2.Open
							objStream.CharSet = "UTF-8"
							'Session.CodePage = 1254 ' UTF-8 code
						
							objStream.WriteText(strString)
						
							'Session.CodePage = 65001 ' UTF-8 code
							'Session.LCID = 1055 '## Do Not Edi
							
							objStream.Position = 3
							objStream.CopyTo objStream2
							objStream2.SaveToFile filename, 2
							objStream.Close
							objStream2.Close
							Set objStream = nothing
							Set objStream2 = nothing

End Function

function regMatch(strString,regExPattern) 
    Set myRegExp = New RegExp
    myRegExp.IgnoreCase = True
    myRegExp.Global = True
    myRegExp.Pattern = regExPattern

    Set myMatches = myRegExp.Execute(strString)
    On Error Resume Next 
    if IsEmpty(myMatches) = false Then 
       Set myMatch = myMatches(0)
       regMatch = myMatch.SubMatches(0)
    End if 
    On Error Goto 0
end function 


function regReplace(strString,regExPattern,strReplace) 
    Set myRegExp = New RegExp
    myRegExp.IgnoreCase = True
    myRegExp.Global = True
    myRegExp.Pattern = regExPattern

    regReplace = myRegExp.Replace(strString, strReplace)
end function 

function getSIIFiles(folder) 
    set my_folder = fso.getFolder(folder)
    Set files = my_folder.Files
    filesz = ""
    For each folderIdx In files
        if (Right(folderIdx.Name,4) = ".sii") Then 
            if (filesz <> "") Then 
                filesz = filesz & "\" & folderIdx.Name
            Else 
                filesz = folderIdx.Name
            End If 
        End If
    Next
    getSIIFiles = Split(filesz,"\")

end function 

function getSIIFilesSubs(folder) 
    set my_folder = fso.getFolder(folder)
    Set files = my_folder.Files
    
    For each folderIdx In files
        if (Right(folderIdx.Name,4) = ".sii") OR (Right(folderIdx.Name,4) = ".sui")  Then 
            if (allSIIList <> "") Then 
            allSIIList = allSIIList & "/" & folderIdx.Path
            Else 
                allSIIList = folderIdx.Path
            End If 
        End If
    Next
    getSIIFilesSubs = allSIIList
    ' getSIIFilesSubs = Split(filesz,"/")

end function 


Sub getSubFolders(folder)
    Dim SubFolder
    For Each SubFolder In folder.SubFolders
        getSubFolders SubFolder
    Next
    Dim File
    For Each File In Folder.Files
        if (Right(File.Name,4) = ".sii") OR (Right(File.Name,4) = ".sui")  Then 
            if (allSIIList <> "") Then 
            allSIIList = allSIIList & "/" & File.Path
            Else 
                allSIIList = File.Path
            End If 
        End If
    Next
 
End Sub


function createFolders(folder)
    tmpFolders = Split(folder,"\")
    cfolder = tmpFolders(0)
    For tfl=1 to UBound(tmpFolders)
        If Not fso.FolderExists(cfolder & "\" & tmpFolders(tfl)) Then 
            fso.CreateFolder cfolder & "\" & tmpFolders(tfl)
        End If
        cfolder = cfolder & "\" & tmpFolders(tfl)
    Next 
end function 


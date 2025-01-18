(* $Id$ *)
(* @Id. *)

unit AmebaCore;

interface
procedure AmebaInit;
procedure AmebaDebug(Message : String);

var
	AmebaDoDebug : Boolean = False;

implementation
uses
	AmebaVersion;	(* DEP *)
(* END USE *)
procedure AmebaInit;
begin
	AmebaDebug('Initializing Ameba Library ' + AmebaGetVersion);
end;

procedure AmebaDebug(Message : String);
begin
	if AmebaDoDebug then WriteLn('[DEBUG] ' + Message);
end;

end.

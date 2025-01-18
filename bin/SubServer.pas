(* $Id$ *)
(* @Id. *)
unit SubServer;

interface
function SubcommandServer(Start: Integer) : Integer;

implementation
uses
	SysUtils;
function SubcommandServer(Start: Integer) : Integer;
var
	ArgI : Integer;
begin
	for ArgI := Start to ParamCount do begin
		WriteLn(ParamStr(ArgI));
	end;
	SubcommandServer := 0;
end;

end.

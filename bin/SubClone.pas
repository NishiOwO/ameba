(* $Id$ *)
(* @Id. *)
(* END USE *)
unit SubClone;

interface
function SubcommandClone(Start: Integer) : Integer;

implementation
uses
	SysUtils;
function SubcommandClone(Start: Integer) : Integer;
var
	ArgI : Integer;
begin
	for ArgI := Start to ParamCount do begin
		WriteLn(ParamStr(ArgI));
	end;
	SubcommandClone := 0;
end;

end.

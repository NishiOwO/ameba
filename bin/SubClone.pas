(* $Id$ *)
(* @Id. *)
unit SubClone;

interface
function SubcommandClone(Start: Integer) : Integer;

implementation
uses
	SysUtils,
	StringUtil;	(* DEP *)
(* END USE *)
function SubcommandClone(Start: Integer) : Integer;
var
	ArgI : Integer;
begin
	SubcommandClone := 0;
	for ArgI := Start to ParamCount do begin
		if IsArg(ParamStr(ArgI), 'h', 'help') then begin
			Exit;
		end;
	end;
end;

end.

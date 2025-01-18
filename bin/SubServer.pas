(* $Id$ *)
(* @Id. *)
unit SubServer;

interface
function SubcommandServer(Start: Integer) : Integer;

implementation
uses
	SysUtils,
	StringUtil;	(* DEP *)
(* END USE *)
function SubcommandServer(Start: Integer) : Integer;
var
	ArgI : Integer;
begin
	SubcommandServer := 0;
	for ArgI := Start to ParamCount do begin
		if IsArg(ParamStr(ArgI), 'h', 'help') then begin
			Exit;
		end;
	end;
end;

end.

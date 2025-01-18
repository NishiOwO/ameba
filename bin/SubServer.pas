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
	for ArgI := Start to ParamCount do begin
	end;
	SubcommandServer := 0;
end;

end.

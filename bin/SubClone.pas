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
	for ArgI := Start to ParamCount do begin
	end;
	SubcommandClone := 0;
end;

end.

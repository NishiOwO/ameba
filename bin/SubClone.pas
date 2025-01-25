(* $Id$ *)
(* @Id. *)
unit SubClone;

interface
const
	CloneFlags : Array of String = (
		'h', 'help',	'Displays the help'
	);

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
			WriteLn('Usage: ' + ParamStr(Start - 1) + ' [flags]');
			WriteLn('');
			WriteLn('Flags:');
			ShowFlags(CloneFlags);
			Exit;
		end else begin
			SubcommandClone := 1;
			WriteLn('Invalid option: ' + ParamStr(ArgI));
			Exit;
		end;
	end;
end;

end.

(* $Id$ *)
(* @Id. *)
unit SubServer;

interface
const
	ServerFlags : Array of String = (
		'i', 'inetd',	'Runs as inetd mode'
	);

function SubcommandServer(Start: Integer) : Integer;

implementation

uses
	AmebaServer,
	SysUtils,
	StringUtil;	(* DEP *)
(* END USE *)

function SubcommandServer(Start: Integer) : Integer;
var
	ArgI : Integer;
	RootPath : String;
	RunInetd : Boolean;
begin
	SubcommandServer := 0;
	RootPath := '/var/ameba/root';
	RunInetd := False;
	for ArgI := Start to ParamCount do begin
		if IsArg(ParamStr(ArgI), 'h', 'help') then begin
			WriteLn('Usage: ' + ParamStr(Start - 1) + ' [flags]');
			WriteLn('');
			WriteLn('Flags:');
			ShowFlags(ServerFlags);
			Exit;
		end;
	end;
	AmebaServerStart(RootPath, RunInetd);
end;

end.

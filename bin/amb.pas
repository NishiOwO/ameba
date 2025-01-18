(* $Id$ *)
(* @Id. *)

program amb;

uses
	AmebaVersion,
	StringUtil,
	SysUtils;

var
	ArgI: Integer;

begin
	for ArgI := 1 to ParamCount do begin
		if IsArg(ParamStr(ArgI), 'V', 'version') then begin
			WriteLn('Ameba VCS version ' + AmebaGetVersion());
			Halt(0);
		end else if IsArg(ParamStr(ArgI), 'h', 'help') then begin
			WriteLn('Ameba VCS version ' + AmebaGetVersion());
			WriteLn('Usage: ' + ParamStr(0) + ' [global flags] [subcommand]');
			WriteLn('');
			WriteLn('Global flags:');
			WriteLn('  -h   --help      Displays the help');
			WriteLn('  -V   --version   Displays the version');
			Halt(0);
		end else if HasArgPrefix(ParamStr(ArgI)) then begin
			WriteLn(StdErr, 'Invalid option: ' + ParamStr(ArgI));
			Halt(1);
		end;
	end;
end.

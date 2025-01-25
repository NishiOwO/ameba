(* $Id$ *)
(* @Id. *)

program Main;

uses
	AmebaVersion,
	AmebaCore,
	StringUtil,	(* DEP *)
	SubClone,	(* DEP *)
	SubServer,	(* DEP *)
	SysUtils;
(* END USE *)

const
	GlobalFlags : Array of String = (
		'h', 'help',	'Displays the help',
		'V', 'version',	'Displays the version'
	);
	GlobalSubcommands : Array of Subcommand = (
		(Name: 'clone';		Description: 'Clones the repository';	Call: @SubcommandClone),
		(Name: 'server';	Description: 'Starts the server';	Call: @SubcommandServer)
	);

var
	ArgI : Integer;
	SubI: Integer;

begin
	AmebaDoDebug := True;
	AmebaInit;
	for ArgI := 1 to ParamCount do begin
		if IsArg(ParamStr(ArgI), 'V', 'version') then begin
			WriteLn('Ameba VCS version ' + AmebaGetVersion());
			Halt(0);
		end else if IsArg(ParamStr(ArgI), 'h', 'help') then begin
			WriteLn('Ameba VCS version ' + AmebaGetVersion());
			WriteLn('Usage: ' + ParamStr(0) + ' [global flags] [subcommand] [subcommand flags]');
			WriteLn('');
			WriteLn('Global flags:');
			ShowFlags(GlobalFlags);
			WriteLn('');
			WriteLn('Subcommands:');
			ShowSubcommands(GlobalSubcommands);
			Halt(0);
		end else if HasArgPrefix(ParamStr(ArgI)) then begin
			WriteLn(StdErr, 'Invalid option: ' + ParamStr(ArgI));
			Halt(1);
		end else begin
			for SubI := 0 to Length(GlobalSubcommands) do begin
				if GlobalSubcommands[SubI].Name = ParamStr(ArgI) then begin
					Halt(GlobalSubcommands[SubI].Call(ArgI + 1));
				end;
			end;
			WriteLn(StdErr, 'Invalid subcommand: ' + ParamStr(ArgI));
			Halt(1);
		end;
	end;
	WriteLn(StdErr, 'Type ''' + ParamStr(0) + ' --help'' for usage');
end.

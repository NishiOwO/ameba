(* $Id$ *)
(* @Id. *)

program amb;

uses
	AmebaVersion,
	StringUtil,
	SysUtils;

const
	GlobalFlags : Array of String = (
		'h', 'help',	'Displays the help',
		'V', 'version',	'Displays the version'
	);
	MaxFlagLength : Integer = 15;

var
	ArgI : Integer;

procedure ShowFlags(Flags : Array of String);
var
	FlagI : Integer;
	IndentI : Integer;
begin
	FlagI := 0;
	IndentI := 0;
	repeat
		Write('  -' + Flags[FlagI]);
		Write('   --' + Flags[FlagI + 1]);
		for IndentI := 0 to MaxFlagLength - Length(Flags[FlagI + 1]) do Write(' ');
		WriteLn(Flags[FlagI + 2]);
		FlagI := FlagI + 3;
	until FlagI = Length(Flags);
end;

begin
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
			Halt(0);
		end else if HasArgPrefix(ParamStr(ArgI)) then begin
			WriteLn(StdErr, 'Invalid option: ' + ParamStr(ArgI));
			Halt(1);
		end else begin
			if ParamStr(ArgI) = 'a' then begin
			end else begin
				WriteLn(StdErr, 'Invalid subcommand: ' + ParamStr(ArgI));
				Halt(1);
			end;
		end;
	end;
	WriteLn(StdErr, 'Type ''' + ParamStr(0) + ' --help'' for usage');
end.

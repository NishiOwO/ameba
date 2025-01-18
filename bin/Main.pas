(* $Id$ *)
(* @Id. *)

program Main;

uses
	AmebaVersion,
	StringUtil,
	SubClone,
	SubServer,
	SysUtils;

type
	TSubcommandCall = function(Start: Integer) : Integer;
	Subcommand = record
		Name: String;
		Description: String;
		Call: TSubcommandCall;
	end;

const
	GlobalFlags : Array of String = (
		'h', 'help',	'Displays the help',
		'V', 'version',	'Displays the version'
	);
	GlobalSubcommands : Array of Subcommand = (
		(Name: 'clone';		Description: 'Clones the repository';	Call: @SubcommandClone),
		(Name: 'server';	Description: 'Starts the server';	Call: @SubcommandServer)
	);
	MaxShowLength : Integer = 30;

var
	ArgI : Integer;
	SubI: Integer;

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
		for IndentI := 0 to MaxShowLength - 3 - 2 - 2 - 2 - Length(Flags[FlagI + 1]) do Write(' ');
		WriteLn(Flags[FlagI + 2]);
		FlagI := FlagI + 3;
	until FlagI = Length(Flags);
end;

procedure ShowSubcommands(Subcommands : Array of Subcommand);
var
	SubcommandI : Integer;
	IndentI : Integer;
begin
	SubcommandI := 0;
	IndentI := 0;
	repeat
		Write('  ' + Subcommands[SubcommandI].Name);
		for IndentI := 0 to MaxShowLength - 2 - Length(Subcommands[SubcommandI].Name) do Write(' ');
		WriteLn(Subcommands[SubcommandI].Description);
		SubcommandI := SubcommandI + 1;
	until SubcommandI = Length(Subcommands);
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

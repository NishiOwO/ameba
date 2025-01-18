(* $Id$ *)
(* @Id. *)
(* END USE *)
unit StringUtil;

interface
type
	TSubcommandCall = function(Start: Integer) : Integer;
	Subcommand = record
		Name: String;
		Description: String;
		Call: TSubcommandCall;
	end;

const
	MaxShowLength : Integer = 30;

procedure ShowFlags(Flags : Array of String);
procedure ShowSubcommands(Subcommands : Array of Subcommand);
function IsArg(Argument: String; ExpShort: String; ExpLong: String) : Boolean;
function HasArgPrefix(Argument: String) : Boolean;

implementation
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

function IsArg(Argument: String; ExpShort: String; ExpLong: String) : Boolean;
begin
	IsArg := (('-' + ExpShort) = Argument) or (('--' + ExpLong) = Argument);
end;

function HasArgPrefix(Argument: String) : Boolean;
begin
	HasArgPrefix := False;
	if Length(Argument) > 0 then begin
		if Argument[1] = '-' then begin
			HasArgPrefix := True;
		end;
	end;
end;

end.

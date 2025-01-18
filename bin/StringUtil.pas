(* $Id$ *)
(* @Id. *)
(* END USE *)
unit StringUtil;

interface
function IsArg(Argument: String; ExpShort: String; ExpLong: String) : Boolean;
function HasArgPrefix(Argument: String) : Boolean;

implementation
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

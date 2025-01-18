(* $Id$ *)
(* @Id. *)
unit AmebaVersion;

interface
function AmebaGetVersion(): String;

implementation
function AmebaGetVersion(): String;
begin
	AmebaGetVersion := '0.00';
end;

end.

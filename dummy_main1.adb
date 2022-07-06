with Ada.Text_IO;
with BBS.info;
--
--  This is a simple shell routine to call the embedded lisp interpreter.
--
procedure dummy_main1 is
begin
   Ada.Text_IO.Put_Line("BBS root package");
   Ada.Text_IO.Put_Line("Name:           " & BBS.info.name);
   Ada.Text_IO.Put_Line("Timestamp:      " & BBS.info.timestamp);
   Ada.Text_IO.Put_Line("Build date:     " & BBS.info.build_date);
   Ada.Text_IO.Put_Line("Version string: " & BBS.info.version_string);
   Ada.Text_IO.Put_Line("Version date:   " & Integer'Image(BBS.info.version_date));
   Ada.Text_IO.Put_Line("Version number: " & Integer'Image(BBS.info.version_number));
end dummy_main1;

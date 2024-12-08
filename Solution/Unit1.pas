unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Spin, Menus;

type
  Tmatr = array[0..9, 0..9] of Char;
  TForm1 = class(TForm)
    Enter: TStringGrid;
    lbl_enter: TLabel;
    lbl_Answer: TLabel;
    Coun_R: TSpinEdit;
    lbl3: TLabel;
    menu: TMainMenu;
    File1: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    Save_as: TMenuItem;
    Clear: TMenuItem;
    Run: TMenuItem;
    Exit: TMenuItem;
    Open_Dialog: TOpenDialog;
    Save_Dialog: TSaveDialog;
    Coun_C: TSpinEdit;
    lbl_count: TLabel;
    procedure OpenClick(Sender: TObject);
    procedure LoToSG(name : string);
    procedure SaveClick(Sender: TObject);
    procedure Save_asClick(Sender: TObject);
    procedure SaveMatr(name : String);
    procedure ClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure Coun_RChange(Sender: TObject);
    procedure RunClick(Sender: TObject);
    procedure Coun_CChange(Sender: TObject);
    procedure Coun_RKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  File_Name : string;
  Count_var_C : Integer;
  Count_var_R : Integer;
  matr : Tmatr;

implementation

{$R *.dfm}

procedure TForm1.OpenClick(Sender: TObject);
begin
  if Open_Dialog.Execute then
    begin
      File_Name := Open_Dialog.FileName;
      LoToSG(File_Name);
    end;
end;

procedure TForm1.LoToSG(name : string);
var
  f : TextFile;
  i, j: Integer;
  value : Char;
begin
  AssignFile(F, name);  //Открываем файл для чтения
  Reset(F);
  Readln(F, Count_var_R);  // На первой строчке содержится количество строк
  Readln(F, Count_var_C);  // На первой строчке содержится количество столбцов
  Coun_R.Value := Count_var_R;
  Coun_C.Value := Count_var_C;  // Сохраняем сразу в глобальную переменную
  for i := 0 to Count_var_R - 1 do
    for j := 0 to Count_var_C - 1 do
      begin
        Readln(F, value);        //Читаем по елементу из файла
        Enter.Cells[j, i] := value  // И записываем в StringGrid
      end;
       // Закрываем файл //
  CloseFile(F);
end;

procedure TForm1.SaveClick(Sender: TObject);
begin
  if File_Name <> ''
    then SaveMatr(File_Name)
    else Save_as.Click;
end;

procedure TForm1.SaveMatr(name : String);
var
  i, j : Integer;
  element : Char;
  F : TextFile;
begin
  AssignFile(F, name);  // открываем файл
  Rewrite(F);
  // на первой строке в файле должно быть число - количество строк и столбцов //
  Writeln(F, Count_var_R);
  Writeln(F, Count_var_C);
  // заносим информацию из матрицы в файл //
  for i := 0 to Count_var_R - 1 do
    for j := 0 to Count_var_C - 1 do
      begin
        element := matr[i, j];
        Writeln(F, element);
      end;
  // Закрываем файл //
  CloseFile(F);
end;

procedure TForm1.Save_asClick(Sender: TObject);
begin
  if Save_Dialog.Execute then
    begin
      SaveMatr(Save_Dialog.FileName);
      File_Name := Save_Dialog.FileName;
    end;
end;

procedure TForm1.ClearClick(Sender: TObject);
var
  i : Integer;
begin
  Coun_C.Value := 7;
  Coun_R.Value := 7;
  for i := 0 to Count_var_R - 1 do
    Enter.Rows[i].Clear;
  File_Name := '';
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  Count_var_R := 7;
  Count_var_C := 7;
end;

procedure TForm1.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Coun_RChange(Sender: TObject);
begin
  Enter.RowCount := Coun_R.Value;
  Count_var_R := Coun_R.Value;
end;

procedure TForm1.RunClick(Sender: TObject);
var
  i, j, k: Integer;
  line : string;
  flag, is_not: Boolean;
  maxUniqueCount: Integer;
  maxUniqueColumn: Integer;
  uniqueCount: Integer;
  uniqueSymbols: set of Char;
begin
  is_not := True;
  // Заносим в матрицу для обработки
  for i := 0 to Count_var_R - 1 do
    for j := 0 to Count_var_C - 1 do
      if Enter.Cells[j, i] <> ''
        then matr[i, j] := Enter.Cells[j, i][1]
        else is_not := False;

  if is_not then
    begin
      maxUniqueCount := 0;
      maxUniqueColumn := -1;

      for j := 0 to Count_var_C - 1 do
        begin
          uniqueCount := 0;

          for i := 0 to Count_var_R - 2 do
            begin
              if matr[i, j] <> matr[i+1, j]
                then Inc(uniqueCount);
            end;

          if uniqueCount >= maxUniqueCount then
            begin
              maxUniqueCount := uniqueCount;
              maxUniqueColumn := j;
            end;
        end;

      lbl_Answer.Caption := 'Номер столбца: ' + IntToStr(maxUniqueColumn+1);
    end
  else ShowMessage('Не все ячейки заполнены');
end;

procedure TForm1.Coun_CChange(Sender: TObject);
begin
  Enter.ColCount := Coun_C.Value;
  Count_var_C := Coun_C.Value;
end;

procedure TForm1.Coun_RKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

end.

pageextension 50100 CustomerList extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Message('Hello from CI/CD-2 from VS Code Online!!');
    end;
}
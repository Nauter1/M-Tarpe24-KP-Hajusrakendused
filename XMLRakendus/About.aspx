<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="XMLRakendus.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h2>Elizabeth ül</h2>        <div>        <asp:Xml ID="xml3" runat="server" DocumentSource="~/elizabeth.xml" TransformSource="~/elizabeth.xslt" />        <br />        Otsitav tekst: <asp:TextBox ID="kast1" runat="server" /><br />        Miinimumpikkus: <asp:TextBox ID="kast2" runat="server" /><br />        <asp:Button runat="server" text="Sisesta" />        </div>
        
    </main>
</asp:Content>
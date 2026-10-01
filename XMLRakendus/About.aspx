<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="XMLRakendus.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h2>Elizabeth ül</h2>
        <asp:Xml ID="xml3" runat="server" DocumentSource="~/elizabeth.xml" TransformSource="~/elizabeth.xslt" />
    </main>
</asp:Content>
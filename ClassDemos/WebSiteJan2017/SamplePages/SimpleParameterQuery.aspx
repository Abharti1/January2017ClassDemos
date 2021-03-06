﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SimpleParameterQuery.aspx.cs" Inherits="SamplePages_SimpleParameterQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /><br />
    <div class ="row">
    <asp:Label ID="Label1" runat="server" Text="Enter Artist Name"></asp:Label>&nbsp;&nbsp;
    <asp:TextBox ID="ArtistName" runat="server"></asp:TextBox>&nbsp;&nbsp;
    <asp:LinkButton ID="GetArtistName" runat="server">Get Artist Albums</asp:LinkButton>&nbsp;&nbsp;
        </div>
    <br />
    <div class ="row">
        <asp:GridView ID="ArtistNameGVList" runat="server" AutoGenerateColumns="False" DataSourceID="ArtistNameODS" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="AlbumId" HeaderText="AlbumId" SortExpression="AlbumId">
                    <HeaderStyle HorizontalAlign="Center" BackColor="#999999"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
                <asp:BoundField DataField="ArtistId" HeaderText="ArtistId" SortExpression="ArtistId"></asp:BoundField>
                <asp:BoundField DataField="ReleaseYear" HeaderText="ReleaseYear" SortExpression="ReleaseYear"></asp:BoundField>
                <asp:BoundField DataField="ReleaseLabel" HeaderText="ReleaseLabel" SortExpression="ReleaseLabel"></asp:BoundField>
            </Columns>
        </asp:GridView>
        </div>
    <br />
    <asp:ListView ID="ArtistNameLVLists" runat="server" DataSourceID="ArtistNameODS">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" /></td>
                <%--<td>--%>
                    <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ArtistId") %>' runat="server" ID="ArtistIdLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ReleaseYear") %>' runat="server" ID="ReleaseYearLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ReleaseLabel") %>' runat="server" ID="ReleaseLabelLabel" /></td>
                <td>
                    <%-- %><asp:Label Text='<%# Eval("Artist") %>' runat="server" ID="ArtistLabel" /></td>--%>
            </tr>
        </AlternatingItemTemplate>
        
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data to display for the current artist name</td>
                </tr>
            </table>
        </EmptyDataTemplate>
      
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ArtistId") %>' runat="server" ID="ArtistIdLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ReleaseYear") %>' runat="server" ID="ReleaseYearLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ReleaseLabel") %>' runat="server" ID="ReleaseLabelLabel" /></td>
                <td>
                <%-- %>    <asp:Label Text='<%# Eval("Artist") %>' runat="server" ID="ArtistLabel" /></td>--%>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server">AlbumId</th>
                                <th runat="server">Title</th>
                                <th runat="server">ArtistId</th>
                                <th runat="server">Released</th>
                                <th runat="server">Label</th>
                                <%--><th runat="server">Artist</th> this is the navigation property--%>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                <asp:NumericPagerField></asp:NumericPagerField>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
       
    </asp:ListView>
    <asp:ObjectDataSource ID="ArtistNameODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Albums_GetForArtistbyName" TypeName="ChinookSystem.BLL.AlbumController">
        <SelectParameters>
            <asp:ControlParameter ControlID="ArtistName" PropertyName="Text" Name="name" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>




</asp:Content>


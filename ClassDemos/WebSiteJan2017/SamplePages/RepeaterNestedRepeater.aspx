<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RepeaterNestedRepeater.aspx.cs" Inherits="SamplePages_RepeaterNestedRepeater" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <br /><br />
    <div class="col-sm-6">
    <!--inside a repeater you need as a minimum an itemtemplate
        other templates include HeaderTemplate, FooterTemplate, AlternatingTemplate
        
        outer repeater will report or display flat fields from the DTO class
        outer repeater gets its data source from the ODS control(DataSourceID) 
        the inner repeater will display flat fields from POCO class
        inner repeater gets its datasource from the List<T> field of the DTO class
        (DataSource)

        use of item type patameter on the repeater allows you to use
        object instance referencing (Instance.property)
        for fields instead of Eval("Xxx") referencing.
        -->
    <asp:Repeater ID="ArtistAlbumReleasesB" runat="server"
        DataSourceID ="ArtistAlbumReleasesODS"
        ItemType="Chinook.Data.DTOs.ArtistAlbumReleases">
        <HeaderTemplate>
            <h3>Album Releases for Artist</h3>
        </HeaderTemplate>
        <ItemTemplate>
            <strong><%# Item.Artist %></strong><br />
            <asp:Repeater ID="AlbumsB" runat="server"
                DataSource='<%# Item.Albums %>>'
                ItemType =" Chinook.Data.POCOs.AlbumRelease"
                <HeaderTemplate>
                    <table>
                    <tr>
                        <th>RYear</th>
                        <th>Label</th>
                        <th>Title</th>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><Item.RYear ></td>
                        <td><Item.Label ></td>
                        <td><Item.Title ></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                      </table>
                </FooterTemplate>
            </asp:Repeater>



            </ItemTemplate>


        </div>
    </asp:Repeater>
    <asp:Repeater ID="ArtistAlbumReleasesList" runat="server" >
        <asp:ObjectDataSource ID="ArtistAlbumReleasesODS" runat="server">
            OldValuesParameterFormatString = "original_{0}"
            SelectMethod ="ArtistAlbumReleases_List"
            TypeName ="ChinookSystem.BLL.AlbumController">


        </asp:ObjectDataSource>
    </asp:Repeater>

</asp:Content>


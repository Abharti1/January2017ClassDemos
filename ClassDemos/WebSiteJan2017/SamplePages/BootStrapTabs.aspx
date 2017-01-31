<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BootStrapTabs.aspx.cs" Inherits="SamplePages_BootStrapTabs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>BootStrap Tabs</h1>
    <div class="row">
        <div class="col-md-12">

            <!--Nav tabs-->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#Home" data-toggle="tab">Home</a></li>
                 <li><a href="#Artist" data-toggle="tab">Artist</a></li>
                 <li><a href="#Albums" data-toggle="tab">Albums</a></li>
                  </ul>

                <!-- Tab panes one for each tab-->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="#home">
                        <p>This is an example of using css tabs. Each tab is
                            created in the nav tab area. It is assigned a href
                            value to identify the tab pane.
                        </p>
                        <p>
                            Although only one pane will be viewed or rpesent at a time
                            all panes are loaded with their data.
                            You have access to all controls on all panes at all times.
                        </p>
                    </div>

                    <div role="tabpanel" class="tab-pane" id="#Artist">
                        <asp:ListView ID="ArtistList" runat="server"></asp:ListView>
                        <asp:ObjectDataSource ID="ArtistListODS" runat="server"></asp:ObjectDataSource>
                    </div>

                    <div role="tabpanel" class="tab-pane" id="#Albums">
                        <asp:ListView ID="AlbumList" runat="server" DataSourceID="ArtistAlbumReleases_List"></asp:ListView>
                        <asp:ObjectDataSource ID="ArtistAlbumReleases_List" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Albums_GetForArtistbyName" TypeName="ChinookSystem.BLL.AlbumController">
                            <SelectParameters>
                                <asp:Parameter Name="name" Type="String"></asp:Parameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>

                </div>
           
        </div>

    </div>
</asp:Content>


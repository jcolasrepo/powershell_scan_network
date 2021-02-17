Add-Type -AssemblyName PresentationFramework
#première form , page principale
[xml]$xaml = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Scan" Height="450" Width="800">
    <Grid>
        <Grid.Background>
            <ImageBrush ImageSource="background.jpg"/>
        </Grid.Background>
        <ProgressBar x:Name="progressbar" HorizontalAlignment="Left" Height="24" Margin="611,0,-0.4,0" VerticalAlignment="Top" Width="183"/>
        <TabControl HorizontalAlignment="Left" Height="409" Margin="0,1,0,0" VerticalAlignment="Top" Width="606" Opacity="0.69">
            <TabItem Header="plan réseau" Margin="-2,-2,-159.2,0">
                <Grid Background="#FFE5E5E5">
                    <Button x:Name="buton_valid" Content="Valider" HorizontalAlignment="Left" Margin="317,41,0,0" VerticalAlignment="Top" Width="75"/>
                    <Label Content="Choisir le réseau IP" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top"/>
                    <ComboBox x:Name="combo_netmask" HorizontalAlignment="Left" Margin="144,41,0,0" VerticalAlignment="Top" Width="46" Height="19" RenderTransformOrigin="-0.468,0.474"/>
                    <TextBox x:Name="txtbox_ip" HorizontalAlignment="Left" Height="19" Margin="10,41,0,0" TextWrapping="Wrap" Text="192.168.0.0" VerticalAlignment="Top" Width="120"/>
                    <CheckBox x:Name="checkbox" Content="IP LIBRE" HorizontalAlignment="Left" Margin="214,43,0,0" VerticalAlignment="Top"/>
                    <ListBox x:Name="listbox_IP" HorizontalAlignment="Left" Height="182" Margin="10,65,0,0" VerticalAlignment="Top" Width="120"/>
                    <ListBox x:Name="listbox_netbios" HorizontalAlignment="Left" Height="182" Margin="130,65,0,0" VerticalAlignment="Top" Width="120"/>
                </Grid>
            </TabItem>
            <TabItem Header="TabItem" Margin="-1.8,-2,-249.2,-0.2">
                <Grid Background="#FFE5E5E5">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="3*"/>
                        <ColumnDefinition Width="43*"/>
                    </Grid.ColumnDefinitions>
                </Grid>
            </TabItem>
        </TabControl>
        <ListBox x:Name="menu" HorizontalAlignment="Left" Height="106" Margin="611,29,0,0" VerticalAlignment="Top" Width="173"/>
        <ListBox x:Name="menu2" HorizontalAlignment="Left" Height="270" Margin="611,140,0,0" VerticalAlignment="Top" Width="173"/>
    </Grid>
</Window>


Add-Type -AssemblyName PresentationFramework
#première form , page principale
[xml]$xaml = @'
<Window
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="MainWindow" Height="450" Width="800">
         <Window.Background>
		    <ImageBrush ></ImageBrush>
		</Window.Background>
    <Grid>
        <ProgressBar x:Name="progressbar" HorizontalAlignment="Left" Height="24" Margin="611,0,-0.4,0" VerticalAlignment="Top" Width="183"/>
        <TabControl HorizontalAlignment="Left" Height="409" Margin="0,1,0,0" VerticalAlignment="Top" Width="606" Opacity="0.69">
            <TabItem Header="plan réseau" Margin="-2,-2,-159.2,0">
                <Grid Background="#FFE5E5E5">
                    <Button x:Name="buton_valid" Content="Valider" HorizontalAlignment="Left" Margin="317,41,0,0" VerticalAlignment="Top" Width="75"/>
                    <Label Content="Choisir le réseau IP" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top"/>
                    <ComboBox x:Name="combo_netmask" HorizontalAlignment="Left" Margin="144,41,0,0" VerticalAlignment="Top" Width="46" Height="19" RenderTransformOrigin="-0.468,0.474"/>
                    <TextBox x:Name="txtbox_ip" HorizontalAlignment="Left" Height="19" Margin="10,41,0,0" TextWrapping="Wrap" Text="192.168.0.0" VerticalAlignment="Top" Width="120"/>
                    <CheckBox x:Name="checkbox" Content="IP LIBRE" HorizontalAlignment="Left" Margin="214,43,0,0" VerticalAlignment="Top"/>
                    <ListBox x:Name="listbox_IP" HorizontalAlignment="Left" Height="182" Margin="10,65,0,0" VerticalAlignment="Top" Width="120"/>
                    <ListBox x:Name="listbox_netbios" HorizontalAlignment="Left" Height="182" Margin="130,65,0,0" VerticalAlignment="Top" Width="120"/>
                </Grid>
            </TabItem>
            <TabItem Header="TabItem" Margin="-1.8,-2,-249.2,-0.2">
                <Grid Background="#FFE5E5E5">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="3*"/>
                        <ColumnDefinition Width="43*"/>
                    </Grid.ColumnDefinitions>
                </Grid>
            </TabItem>
        </TabControl>
        <ListBox x:Name="menu" HorizontalAlignment="Left" Height="106" Margin="611,29,0,0" VerticalAlignment="Top" Width="173"/>
        <ListBox x:Name="menu2" HorizontalAlignment="Left" Height="270" Margin="611,140,0,0" VerticalAlignment="Top" Width="173"/>
    </Grid>
</Window>
'@

[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
$reader=(New-Object System.Xml.XmlNodeReader $xaml) 
#on load le bon background
$Form=[Windows.Markup.XamlReader]::Load( $reader )
$Form.add_Loaded({
		$Form.Background.ImageSource = "$pwd\background.jpg"
        $Form.Icon = "$pwd\script.ico"
	})




#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
$Form.ShowDialog() | out-null

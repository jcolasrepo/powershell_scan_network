#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
#Projet: Scripting 
#
#auteur :
#-Colas Jérémy Etudiant 
#2021
#free to use
#                            _________
#                           /         /.
#    .-------------.       /_________/ |
#   /             / |      |         | |
#  /+============+\ |      | |====|  | |
#  ||C:\>SIO     || |      |         | |
#  ||            || |      | |====|  | |
#  ||            || |      |   ___   | |
#  ||            || |      |  |404|  | |
#  ||            ||/@@@    |   ---   | |
#  \+============+/    @   |_________|./.
#                     @          ..  ....'
#  ..................@     __.'.'  ''
# /oooooooooooooooo//     ///
#/................//     /_/
#------------------
#
#
#
#
#
#
#form creation
#
#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
                                        #form

Add-Type -AssemblyName PresentationFramework
#première form , page principale
[xml]$xaml = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="scan" Height="450" Width="800">
        <Window.Background>
		    <ImageBrush ></ImageBrush>
		</Window.Background>
    <Grid>
        <ProgressBar x:Name="progressbar" HorizontalAlignment="Left" Height="24" Margin="611,0,-0.4,0" VerticalAlignment="Top" Width="183"/>
        <TabControl HorizontalAlignment="Left" Height="409" Margin="0,1,0,0" VerticalAlignment="Top" Width="606" Opacity="0.69">
            <TabItem Header="plan réseau" Margin="-2,-2,-159.2,0">
                <Grid Background="#FFE5E5E5">
                    <Button Name="buton_valid" Content="Valider" HorizontalAlignment="Left" Margin="317,41,0,0" VerticalAlignment="Top" Width="75"/>
                    <Label Content="Choisir le réseau IP" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top"/>
                    <ComboBox Name="combo_netmask" HorizontalAlignment="Left" Margin="144,41,0,0" VerticalAlignment="Top" Width="46" Height="19" RenderTransformOrigin="-0.468,0.474"/>
                    <TextBox Name="txtbox_ip" HorizontalAlignment="Left" Height="19" Margin="10,41,0,0" TextWrapping="Wrap" Text="192.168.0.0" VerticalAlignment="Top" Width="120"/>
                    <CheckBox Name="checkbox" Content="IP LIBRE" HorizontalAlignment="Left" Margin="214,43,0,0" VerticalAlignment="Top"/>
                    <ListBox Name="listbox_IP" HorizontalAlignment="Left" Height="182" Margin="10,65,0,0" VerticalAlignment="Top" Width="120"/>
                    <ListBox Name="listbox_netbios" HorizontalAlignment="Left" Height="182" Margin="130,65,0,0" VerticalAlignment="Top" Width="120"/>
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
        <ListBox Name="menu" HorizontalAlignment="Left" Height="106" Margin="611,29,0,0" VerticalAlignment="Top" Width="173"/>
        <ListBox Name="menu2" HorizontalAlignment="Left" Height="270" Margin="611,140,0,0" VerticalAlignment="Top" Width="173"/>
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
#declaration de variable

#variable object grid
$listbox_menu=$Form.FindName("menu")
$listbox_menu2_log=$Form.FindName("menu2")
$progressbar=$Form.FindName("progressbar")
#variable scan réseau
$button_Valider=$Form.FindName("Valider")
$combo_netmask=$Form.FindName("combo_netmask")
$txtbox_network=$Form.FindName("txtbox_ip")
$checkbox_ip_exporter_file=$Form.FindName("checkbox")
$listbox_IP=$Form.FindName("listbox_IP")
$listbox_netbios=$Form.FindName("listbox_netbios")

#variable autre pannel

#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
#demarrage du script

#remplir la combobox netmask
$Listnetmask = "32" , "31" , "30" , "29" , "28" , "27" , "26" , "25" , "24" , "23" , "22" , "21" , "20" , "19" , "18" , "17" , "16"

 Foreach ($netmask in $Listnetmask)
    { 
    $combo_netmask.Items.Add($netmask)
    #clear
    }

#remplir la listbox menu
   #Information sur l'environment
    $hour = Get-Date -Format "HH:mm"  #on récupe l'heure
    $date = Get-Date -Format "dd/MM/yyyy" #on récupère la date sous la forme "Jour/Mois/Année"
    $userName= [Environment]::UserName
    $IPV4= Get-NetIPAddress -AddressFamily IPv4

    [void] $listbox_menu.Items.Add("Nom de l'utilisateur: $userName")
    [void] $listbox_menu.Items.Add("`n`nHorodatage: $hour $date") #date
    [void] $listbox_menu.Items.Add("IP : $ipV4") #IP de l'ordinateur


#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
#code

$add_reseau=$txtbox_network.Text
try{$select_netmask=$combo_netmask.SelectedItem.ToString()}catch {""}

#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
$Form.ShowDialog() | out-null


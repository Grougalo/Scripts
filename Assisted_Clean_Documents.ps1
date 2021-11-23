$determinant = Read-host "[G]ame or [A]ppdata ?"
$folder_to_move = Read-host "Folder" #Nom du répertoire à ranger
Function Clean_Documents {
    param (
        [string]$folder,
        [String]$path_where_to_move
    )

    $path_documents = "C:\Users\Antoine\OneDrive\Documents\" #Chemin vers les documents

    #Déplacer le dossier vers le bon répertoire
    "Move-Item $path_documents$folder $path_where_to_move"
    Invoke-Expression "Move-Item $path_documents$folder `"$path_where_to_move`""

    #Créer la jonction vers le dossier dans le répertoire document
    $command = "cmd /c mklink /J" 
    $link ="$path_documents$folder" #Chemin du lien
    $target = "$path_where_to_move$folder" #Chemin de la target du lien
    Invoke-Expression "$command `"$link`" `"$target`""

    #cacher la jonction
    Invoke-Expression "attrib /L +h `"$path_documents$folder`""
    "Jonction hiden"
}

#Ranger les Jeux
if ($determinant -eq "G") {
    $path_games = "C:\Users\Antoine\OneDrive\Documents\My Games\" #Chemin vers le dossier réservé aux jeux
    Clean_Documents $folder_to_move $path_games
}

#Ranger les Applis
Elseif ($determinant -eq "A") {
    $path_appdata = "C:\Users\Antoine\OneDrive\Documents\Appdata\" #Chemin vers le dossier réservé aux applis
    Clean_Documents $folder_to_move $path_appdata
}
#Persistent

ShowStartupMessage() {
    MsgBox, 4096, Welcome to Patapon Song Player,
        (LTrim

        To start a song press:`n

        Ctrl + 1: Pata-Pata-Pata-Pon`n
        Ctrl + 2: Pon-Pon-Pata-Pon`n
        Ctrl + 3: Pon-Pon-Chaka-Chaka`n
        Ctrl + 4: Chaka-Chaka-Pata-Pon`n

        Other functions:`n

        Ctrl + 0 to Stop chosen song`n
        Ctrl + Shift + 0 to Close script`n
        Ctrl + 9 to Pause script`n
        Ctrl + Shift + 9 to Suspend hotkeys
        )
}


ShowStartupMessage()

; ^ - Ctrl
; + - Shift

; Hotkeys:
^1::song.pataPataPataPon() ; Pata-Pata-Pata-Pon
^2::song.ponPonPataPon() ; Pon-Pon-Pata-Pon
^3::song.ponPonChakaChaka() ; Pon-Pon-Chaka-Chaka
^4::song.chakaChakaPataPon() ; Chaka-Chaka-Pata-Pon
^0::song.stopSong() ; Stop chosen song
^9::Pause ; Pause script
^+9::Suspend ; Suspend hotkeys
^+0::ExitApp ; Close script

; Code...
song := new Song

class Song {
    songPlaying := false

    pataPataPataPon() {
        this.songPlaying := true
        Loop {
            Loop 3 {
                if GetKeyState("0", "P")
                    break 2
                song.sendLetter("a") ; pata
            }
            song.sendLetter("x") ; pon
            Sleep, 2000 ; patapon's song
            if (!this.songPlaying)
                break
        }
        this.songPlaying := false
    }

    ponPonPataPon() {
        this.songPlaying := true
        Loop {
            Loop 2 {
                if GetKeyState("0", "P")
                    break 2
                song.sendLetter("x") ; pon
            }
            song.sendLetter("a") ; pata
            song.sendLetter("x") ; pon
            Sleep, 2000 ; patapon's song
            if (!this.songPlaying)
                break
        }
        this.songPlaying := false
    }

ponPonChakaChaka() {
        this.songPlaying := true
        Loop {
            Loop 2 {
                if GetKeyState("0", "P")
                    break 2
                song.sendLetter("x") ; pon
            }
            Loop 2 {
                if GetKeyState("0", "P")
                    break 2
                song.sendLetter("s") ; chaka
            }
            Sleep, 2000 ; patapon's song
            if (!this.songPlaying)
                break
        }
        this.songPlaying := false
    }

chakaChakaPataPon() {
        this.songPlaying := true
        Loop {
            Loop 2 {
                if GetKeyState("0", "P")
                    break 2
                song.sendLetter("s") ; chaka
            }
            song.sendLetter("a") ; pata
            song.sendLetter("x") ; pon
            Sleep, 2000 ; patapon's song
            if (!this.songPlaying)
                break
        }
        this.songPlaying := false
    }

    stopSong() {
        this.songPlaying := false
    }

    sendLetter(letter) {
        SendInput, {%letter% down}
        Sleep, 50
        SendInput, {%letter% up}
        Sleep, 450
    }
}

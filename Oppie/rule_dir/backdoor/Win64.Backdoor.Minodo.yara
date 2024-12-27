rule Win32_Backdoor_Minodo : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "MINODO"
        description         = "Yara rule that detects Minodo backdoor."

        tc_detection_type   = "Backdoor"
        tc_detection_name   = "Minodo"
        tc_detection_factor = 5

    strings:

        $generate_system_id = {
            40 55 53 56 57 41 56 48 8D 6C 24 ?? 48 81 EC ?? ?? ?? ?? 4C 8B F1 48 8D 55 ?? 48 8D
            4D ?? C7 45 ?? ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 33 DB 85 C0 75 ?? 66 C7 45 ?? ?? ?? 4C
            8D 45 ?? 48 8D 55 ?? B9 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 85 C0 75
            ?? 66 C7 45 ?? ?? ?? 48 83 4D ?? ?? 4C 8D 4D ?? 4C 8D 45 ?? 8B CB 48 8B D3 BE ?? ??
            ?? ?? 48 85 D2 7E ?? 44 8A 54 15 ?? EB ?? 44 8A 95 ?? ?? ?? ?? 41 8A 01 49 FF C1 48
            FF C2 32 44 15 ?? 41 32 C2 41 32 00 49 FF C0 88 44 15 ?? 41 38 19 75 ?? 83 C9 ?? 4C
            8D 4D ?? 41 38 18 75 ?? 83 C9 ?? 4C 8D 45 ?? 48 3B D6 75 ?? 83 C9 ?? 48 8B D3 83 F9
            ?? 75 ?? 48 8D 15 ?? ?? ?? ?? 48 8D 4D ?? FF 15 ?? ?? ?? ?? 48 8D 5D ?? 49 8B FE 44
            0F B6 03 48 8D 55 ?? 48 8B CF FF 15 ?? ?? ?? ?? 48 83 C7 ?? 48 FF C3 48 FF CE 75 ??
            FF 15 ?? ?? ?? ?? 48 8D 15 ?? ?? ?? ?? 48 8D 4D ?? 8B D8 FF 15 ?? ?? ?? ?? 48 8D 55
            ?? 44 8B CB 4D 8B C6 49 8B CE FF 15 ?? ?? ?? ?? 48 81 C4 ?? ?? ?? ?? 41 5E 5F 5E 5B
            5D C3
        }

        $generate_encrypt_and_send_key = {
            48 8B C4 48 89 58 ?? 48 89 68 ?? 48 89 70 ?? 48 89 78 ?? 41 56 48 81 EC ?? ?? ?? ??
            8B F2 E8 ?? ?? ?? ?? 48 85 C0 75 ?? 33 C0 E9 ?? ?? ?? ?? 48 8B 40 ?? 48 8B 08 8B 09
            E8 ?? ?? ?? ?? 48 8B F8 48 85 C0 74 ?? 45 33 C0 45 8D 70 ?? 41 8D 50 ?? 41 8B CE E8
            ?? ?? ?? ?? 48 8B D8 83 F8 ?? 74 ?? 41 8D 6E ?? 48 8D 44 24 ?? 8B CD C6 00 ?? 48 FF
            C0 48 FF C9 75 ?? 0F B7 CE 66 44 89 74 24 ?? E8 ?? ?? ?? ?? 48 8B CF 66 89 44 24 ??
            E8 ?? ?? ?? ?? 48 63 FB 48 8D 54 24 ?? 48 8B CF 44 8B C5 89 44 24 ?? E8 ?? ?? ?? ??
            85 C0 74 ?? 48 8B CF E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 48 8D 2D ?? ?? ?? ?? BE ?? ?? ??
            ?? 48 8B CD 8B D6 E8 ?? ?? ?? ?? 66 C7 44 24 ?? ?? ?? 33 C9 8A 44 29 ?? 48 FF C9 88
            44 0C ?? 48 FF CE 75 ?? 8D 56 ?? 44 8D 46 ?? 48 8D 4C 24 ?? E8 ?? ?? ?? ?? 48 8B CF
            8B F0 85 C0 74 ?? 48 8D 54 24 ?? 45 33 C9 44 8B C0 E8 ?? ?? ?? ?? 3B C6 74 ?? 48 8B
            CF E8 ?? ?? ?? ?? 33 DB 8B C3 4C 8D 9C 24 ?? ?? ?? ?? 49 8B 5B ?? 49 8B 6B ?? 49 8B
            73 ?? 49 8B 7B ?? 49 8B E3 41 5E C3
        }

        $get_encrypt_and_send_system_info = {
            48 89 5C 24 ?? 48 89 74 24 ?? 48 89 7C 24 ?? 55 48 8D 6C 24 ?? 48 81 EC ?? ?? ?? ??
            8B F1 48 8B CA 48 8B DA FF 15 ?? ?? ?? ?? C6 44 24 ?? ?? 48 63 F8 40 88 7C 24 ?? 4C
            8B C7 85 C0 74 ?? 48 8D 44 24 ?? 48 2B D8 48 8D 4C 24 ?? 49 FF C8 4A 8D 0C 01 8A 04
            0B 88 01 75 ?? 83 C7 ?? 48 63 DF E8 ?? ?? ?? ?? BA ?? ?? ?? ?? F6 D8 48 8D 45 ?? 1A
            C9 80 E1 ?? 80 C9 ?? FF C7 88 4C 1C ?? 8B CA C6 00 ?? 48 FF C0 48 FF C9 75 ?? 48 8D
            4D ?? 89 55 ?? FF 15 ?? ?? ?? ?? 8A 45 ?? 48 63 CF 88 44 0C ?? 8A 45 ?? FF C7 48 63
            CF FF C7 BB ?? ?? ?? ?? 88 44 0C ?? 8A 45 ?? 48 63 CF 88 44 0C ?? 8A 45 ?? FF C7 48
            63 CF FF C7 4C 8D 85 ?? ?? ?? ?? 88 44 0C ?? 8A 45 ?? 48 63 D7 88 44 14 ?? 8B 45 ??
            FF C7 48 63 D7 8D 4B ?? C6 44 24 ?? ?? 89 44 14 ?? 48 8D 54 24 ?? 83 C7 ?? 89 9D ??
            ?? ?? ?? FF 15 ?? ?? ?? ?? 48 8D 4C 24 ?? FF 15 ?? ?? ?? ?? 44 8B C0 8D 48 ?? 03 CF
            48 63 D1 48 83 FA ?? 76 ?? 44 8D 43 ?? 44 2B C7 48 63 C7 FF C7 4C 8D 54 24 ?? 44 88
            44 04 ?? 48 63 C7 49 63 D0 4C 03 D0 45 85 C0 74 ?? 4C 8D 4C 24 ?? 4A 8D 0C 12 4D 2B
            CA 48 FF C9 41 8A 04 09 88 01 48 FF CA 75 ?? 48 8D 95 ?? ?? ?? ?? 48 8D 4C 24 ?? 41
            03 F8 C6 44 24 ?? ?? 89 9D ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 48 8D 4C 24 ?? FF 15 ?? ??
            ?? ?? 44 8B C0 8D 48 ?? 03 CF 48 63 D1 48 83 FA ?? 76 ?? 41 B8 ?? ?? ?? ?? 44 2B C7
            48 63 C7 FF C7 4C 8D 54 24 ?? 44 88 44 04 ?? 48 63 C7 49 63 D0 4C 03 D0 45 85 C0 74
            ?? 4C 8D 4C 24 ?? 4A 8D 0C 12 4D 2B CA 48 FF C9 42 8A 04 09 88 01 48 FF CA 75 ?? 4C
            8D 4C 24 ?? 48 8D 54 24 ?? 44 03 C7 8B CE E8 ?? ?? ?? ?? 4C 8D 9C 24 ?? ?? ?? ?? 49
            8B 5B ?? 49 8B 73 ?? 49 8B 7B ?? 49 8B E3 5D C3
        }

        $copy_payload_into_allocated_memory = {
            48 89 5C 24 ?? 48 89 6C 24 ?? 56 57 41 56 48 83 EC ?? 49 8B D8 48 63 F2 48 8B F9 41
            C6 00 ?? C7 44 24 ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 84 C0 75 ?? 66 C7 03 ?? ?? B8 ?? ??
            ?? ?? E9 ?? ?? ?? ?? 4C 8D 4C 24 ?? 4C 8D 44 24 ?? 48 8B D3 48 8B CF E8 ?? ?? ?? ??
            8B E8 85 C0 74 ?? 41 B9 ?? ?? ?? ?? 41 B8 ?? ?? ?? ?? 48 8B D6 33 C9 4C 8B F6 FF 15
            ?? ?? ?? ?? 48 8B F0 48 85 C0 75 ?? 66 C7 03 ?? ?? FF 15 ?? ?? ?? ?? 89 43 ?? 8D 46
            ?? EB ?? 4D 8B C6 48 8B D7 48 8B C8 E8 ?? ?? ?? ?? 48 83 64 24 ?? ?? 83 64 24 ?? ??
            4C 8D 04 2E 45 33 C9 33 D2 33 C9 FF 15 ?? ?? ?? ?? 48 8B C8 FF 15 ?? ?? ?? ?? 8B 44
            24 ?? 48 8B 5C 24 ?? 48 8B 6C 24 ?? 48 83 C4 ?? 41 5E 5F 5E C3
        }

        $execute_payload_from_temp = {
            40 53 48 81 EC ?? ?? ?? ?? 41 B8 ?? ?? ?? ?? 4C 8B D1 48 8D 44 24 ?? 41 8B D0 33 DB
            88 18 48 FF C0 48 FF CA 75 ?? 48 8D 44 24 ?? 8D 4A ?? 88 18 48 FF C0 48 FF C9 75 ??
            48 8D 44 24 ?? 44 89 44 24 ?? 45 33 C9 48 89 44 24 ?? 48 8D 44 24 ?? 45 33 C0 48 89
            44 24 ?? 48 89 5C 24 ?? 48 89 5C 24 ?? 49 8B D2 89 5C 24 ?? C7 84 24 ?? ?? ?? ?? ??
            ?? ?? ?? 89 5C 24 ?? 66 89 9C 24 ?? ?? 00 00 FF 15 ?? ?? ?? ?? 85 C0 74 ?? 48 8B 4C
            24 ?? FF 15 ?? ?? ?? ?? 48 8B 4C 24 ?? FF 15 ?? ?? ?? ?? B0 ?? EB ?? 32 C0 48 81 C4
            ?? ?? ?? ?? 5B C3
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            $generate_system_id
        ) and
        (
            $generate_encrypt_and_send_key
        ) and
        (
            $get_encrypt_and_send_system_info
        ) and
        (
            $copy_payload_into_allocated_memory
        ) and
        (
            $execute_payload_from_temp
        )
}
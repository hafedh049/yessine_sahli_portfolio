def _main():

    _letter_counter = 0
    _separator_counter = 0
    _digit_counter = 0
    _other_counter = 0

    def _is_letter(c: str):
        return "a" <= c <= "z" or "A" <= c <= "Z"

    def _is_digit(c: str):
        return "0" <= c <= "9"

    def _is_separator(c: str):
        return c in ["/", ",", " ", "\n", ";", ":", ".", "?", "!", "-", "\t"]

    while (c := input("Enter a character: ")) != "#":
        if _is_letter(c):
            _letter_counter += 1
        elif _is_digit(c):
            _digit_counter += 1
        elif _is_separator(c):
            _separator_counter += 1
        else:
            _other_counter += 1

    print(
        f"Digits counter : {_digit_counter}\nLetter counter : {_letter_counter}\nSeparator counter : {_separator_counter}\nOther counter : {_other_counter}",
    )


_main()

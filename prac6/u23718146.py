import sys

def main():
    # Validate arguments
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file> <word>")
        return

    filename = sys.argv[1]
    word = sys.argv[2].lower()

    matches = []

    try:
        with open(filename, "r", encoding="ascii") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue

                # Split into student number and name
                try:
                    student_num_str, full_name = line.split(",", 1)
                except ValueError:
                    continue  # skip malformed lines

                student_num_str = student_num_str.strip()
                full_name = full_name.strip()

                # Extract last name
                name_parts = full_name.split()
                if not name_parts:
                    continue

                last_name = name_parts[-1].lower()

                # Compare alphabetically
                if last_name > word:
                    try:
                        student_num = int(student_num_str)
                        matches.append(student_num)
                    except ValueError:
                        continue

    except FileNotFoundError:
        print("None found")
        return

    if not matches:
        print("None found")
        return

    # Sort numerically
    matches.sort()

    for num in matches:
        print(num)


if __name__ == "__main__":
    main()
import os
import pwd
import grp

def list_users():
    users = [user.pw_name for user in pwd.getpwall()]
    return "\nUsers:\n" + "\n".join(users)

def list_groups():
    groups = [group.gr_name for group in grp.getgrall()]
    return "\nGroups:\n" + "\n".join(groups)

def list_filesystem():
    output = "\nFile System Structure:\n"
    for root, dirs, files in os.walk("/"):
        output += f"{root}/\n"
        for dir in dirs:
            output += f"  [DIR] {dir}\n"
        for file in files:
            output += f"  [FILE] {file}\n"
    return output

def save_to_file(filename="system_info.txt"):
    with open(filename, "w") as f:
        f.write(list_users() + "\n")
        f.write(list_groups() + "\n")
        f.write(list_filesystem() + "\n")
    print(f"Output saved to {filename}")

if __name__ == "__main__":
    save_to_file()
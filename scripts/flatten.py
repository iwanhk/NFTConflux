from scripts.functions import *


def main():
    active_network = network.show_active()
    print("Current Network:" + active_network)

    admin, creator, consumer, iwan = get_accounts(active_network)

    try:
        nft721= NFT721.deploy("https://nftstorage.link/ipfs/bafybeicsfqe2q4rwea7pnn3tpymfayoumbfgclbhtfza7f2eza7sarjqrm/", addr(admin))
        nft1155= NFT1155.deploy("https://nftstorage.link/ipfs/bafybeicsfqe2q4rwea7pnn3tpymfayoumbfgclbhtfza7f2eza7sarjqrm/", addr(admin))

        flat_contract('NFT721', NFT721.get_verification_info())
        flat_contract('NFT1155', NFT1155.get_verification_info())

    except Exception:
        console.print_exception()
        # Test net contract address


if __name__ == "__main__":
    main()

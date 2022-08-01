from scripts.functions import *


def main():
    active_network = network.show_active()
    print("Current Network:" + active_network)

    admin, creator, consumer, iwan = get_accounts(active_network)

    try:
        if active_network in LOCAL_NETWORKS:
            nft721= NFT721.deploy("https://nftstorage.link/ipfs/bafybeicsfqe2q4rwea7pnn3tpymfayoumbfgclbhtfza7f2eza7sarjqrm/", addr(admin))
            nft1155= NFT1155.deploy("https://nftstorage.link/ipfs/bafybeicsfqe2q4rwea7pnn3tpymfayoumbfgclbhtfza7f2eza7sarjqrm/", addr(admin))

            for i in range(10):
                nft721.mint(creator, i, addr(creator))
                nft1155.mint(consumer, 1, addr(consumer))

        if active_network in TEST_NETWORKS:
            nft721= NFT721[-1]
            nft1155= NFT1155[-1]

            for i in range(9):
                nft721.mint(creator, i+1, addr(creator))
                nft1155.mint(consumer, 1, addr(admin))

    except Exception:
        console.print_exception()
        # Test net contract address


if __name__ == "__main__":
    main()

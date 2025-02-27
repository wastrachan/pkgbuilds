# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=google-cloud-cli-gke-gcloud-auth-plugin
pkgver=512.0.0
pkgrel=1
pkgdesc="A google-cloud-cli component that provides a kubectl authentication plugin for GKE."
arch=('x86_64')
url="https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke"
license=('Apache-2.0')
depends=('google-cloud-cli' 'kubectl>=1.26')
options=('!strip')
source=("https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig_amd64.tar.gz")
sha256sums=('826485f05c3092a3135c81b25e3ac5dae97de609d52cfa45274c3fd47e1ae3a3')

package() {
    cd "$srcdir/google-cloud-sdk"  # Does not match naming convention google-cloud-cli

    # Install plugin manifests and snapshots
    manifests=(
        "gke-gcloud-auth-plugin-linux-${CARCH}.manifest"
        "gke-gcloud-auth-plugin-linux-${CARCH}.snapshot.json"
        "gke-gcloud-auth-plugin.manifest"
        "gke-gcloud-auth-plugin.snapshot.json"
    )
    for item in ${manifests[@]}; do
        install -Dm644 \
            ".install/${item}" \
            "${pkgdir}/opt/google-cloud-cli/.install/${item}"
    done

    # Install plugin binary
    install -Dm755 \
        "bin/gke-gcloud-auth-plugin" \
        "${pkgdir}/opt/google-cloud-cli/bin/gke-gcloud-auth-plugin"

    # Symlink plugin binary
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s \
        "/opt/google-cloud-cli/bin/gke-gcloud-auth-plugin" \
        "${pkgdir}/usr/bin/gke-gcloud-auth-plugin"
}

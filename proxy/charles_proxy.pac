function FindProxyForURL(url, host) {
    var ip = "10.93.140.223:8888"
    return `PROXY ${ip}; DIRECT`;
}

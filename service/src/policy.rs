//! Policy-derived peer allowlists for ZTXS service servers.

use std::collections::HashMap;
use zt_services::structures::ServiceCfgType;

/// Builds a deduplicated peer allowlist from named client service policy entries.
pub fn peer_allowlist(
    cfg_map: &HashMap<String, ServiceCfgType>,
    client_names: &[&str],
) -> Result<Vec<(String, u16)>, String> {
    let mut allowed = Vec::new();
    for name in client_names {
        let cfg = cfg_map
            .get(*name)
            .ok_or_else(|| format!("Client config not found: {}", name))?;
        let ip = cfg
            .ip_address_text
            .as_ref()
            .ok_or_else(|| format!("{} IP not configured", name))?
            .clone();
        let port = cfg
            .service_port_numeric
            .ok_or_else(|| format!("{} port not configured", name))?;
        let entry = (ip, port);
        if !allowed.contains(&entry) {
            allowed.push(entry);
        }
    }
    Ok(allowed)
}
